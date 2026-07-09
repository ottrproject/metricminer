# Extracting data from Google Forms

#' Get Google Forms
#' @description This is a function to get the Google Forms API requests.
#' The scopes it uses are the `See all your Google Forms forms.` and `See all responses to your Google Forms forms.`
#' If you don't check this box on the OAuth screen this function won't work.
#' @param url The endpoint URL for the request
#' @param token credentials for access to Google using OAuth. `authorize("google")`
#' @param body_params The body parameters for the request
#' @param query_params The body parameters for the request
#' @param return_request Should a list of the request be returned as well?
#' @returns This function returns a list from a API response JSON file
#' @importFrom httr config accept_json content
#' @importFrom jsonlite fromJSON
#' @importFrom assertthat assert_that is.string
#' @export
request_google_forms <- function(token, url,
                                 body_params = NULL,
                                 query_params = NULL,
                                 return_request = TRUE) {
  if (is.null(token)) {
    # Get auth token
    token <- get_token(app_name = "google")
  }
  config <- httr::config(token = token)

  result <- httr::GET(
    url = url,
    body = body_params,
    query = query_params,
    config = config,
    httr::accept_json(),
    encode = "json"
  )

  request_info <- list(
    url = url,
    token = token,
    body_params = body_params,
    query_params = query_params
  )

  if (httr::status_code(result) != 200) {
    httr::stop_for_status(result)
    return(result)
  }

  # Process and return results
  result_content <- httr::content(result, "text")
  result_list <- jsonlite::fromJSON(result_content)

  if (return_request) {
    return(list(result = result_list, request_info = request_info))
  } else {
    return(result_list)
  }
}


#' Get Google Forms
#' @description This is a function to get Google Form info and responses from the API.
#' The scopes it uses are the `See all your Google Forms forms.` and `See all responses to your Google Forms forms.`
#' If you don't check this box on the OAuth screen this function won't work.
#' @param form_id The form ID we need to get
#' @param token credentials for access to Google using OAuth. `authorize("google")`
#' @param dataformat What format would you like the data? Options are "raw" or "dataframe". "dataframe" is the default.
#' @returns This returns a list of the form info and responses to the google form. Default is to make this a list of nicely formatted dataframes.
#' @export
#' @examples \dontrun{
#'
#' authorize("google")
#' form_info <- get_google_form(
#'   "https://docs.google.com/forms/d/1Neyj7wwNpn8wC7NzQND8kQ30cnbbETSpT0lKhX7uaQY/edit"
#' )
#' form_id <- "https://docs.google.com/forms/d/1Neyj7wwNpn8wC7NzQND8kQ30cnbbETSpT0lKhX7uaQY/edit"
#'
#' ### OR You can give it a direct form id
#'
#' form_info <- get_google_form("1Neyj7wwNpn8wC7NzQND8kQ30cnbbETSpT0lKhX7uaQY")
#' }
get_google_form <- function(form_id, token = NULL, dataformat = "dataframe") {
  if (is.null(token)) {
    # Get auth token
    token <- get_token(app_name = "google")
  }
  # If a URL is supplied, only take the ID from it.
  if (grepl("https:", form_id[1])) {
    form_id <- gsub("\\/viewform$|\\/edit$", "", form_id)
    form_id <- gsub("https://docs.google.com/forms/d/e/|https://docs.google.com/forms/d/", "", form_id)
  }

  form_info_url <- gsub("\\{formId\\}", form_id, "https://forms.googleapis.com/v1/forms/{formId}")
  form_response_url <- gsub("\\{formId\\}", form_id, "https://forms.googleapis.com/v1/forms/{formId}/responses")

  message(paste0("Trying to grab form: ", form_id))

  form_info <- request_google_forms(
    url = form_info_url,
    token = token
  )

  response_info <- request_google_forms(
    url = form_response_url,
    token = token,
    return_request = TRUE
  )

  result <- list(
    form_metadata = form_info,
    response_info = response_info
  )

  if (dataformat == "dataframe") {
    metadata <- get_question_metadata(form_info)

    if (length(result$response_info$result) > 0) {
      answers_df <- extract_answers(result, metadata = metadata)
    } else {
      answers_df <- "no responses yet"
    }
    result <- list(
      title = result$form_metadata$result$info$title,
      metadata = metadata,
      answers = answers_df
    )
  }
  return(result)
}


#' Get multiple Google forms
#' @description This is a wrapper function for returning google form info and
#' responses for multiple forms at once. The scopes it uses are the `See all your Google Forms forms.`
#' and `See all responses to your Google Forms forms.`
#' If you don't check this box on the OAuth screen this function won't work.
#' @param form_ids a vector of form ids you'd like to retrieve information for
#' @param token credentials for access to Google using OAuth. `authorize("google")`
#' @param dataformat What format would you like the data? Options are "raw" or "dataframe". "dataframe" is the default.
#' @returns This returns a list of API information for google forms
#' @importFrom purrr map
#' @importFrom janitor make_clean_names
#' @export
#' @examples \dontrun{
#'
#' authorize("google")
#' form_list <- googledrive::drive_find(
#'   shared_drive = googledrive::as_id("0AJb5Zemj0AAkUk9PVA"),
#'   type = "form"
#' )
#'
#' multiple_forms <- get_multiple_forms(form_ids = form_list$id)
#' }
get_multiple_forms <- function(form_ids = NULL, token = NULL, dataformat = "dataframe") {
  # Get all the forms info
  all_form_info <- sapply(form_ids, function(form_id) {
    get_google_form(
      form_id = form_id,
      token = token,
      dataformat = dataformat
    )
  }, simplify = FALSE, USE.NAMES = TRUE)

  if (dataformat == "dataframe") {
    # Set up the names
    titles <- purrr::map(all_form_info, ~ .x$title)
    titles <- janitor::make_clean_names(titles)

    # Set as names
    names(all_form_info) <- titles
    }

  all_form_info
}

extract_google_form_rows <- function(df) {
  if (is.null(df) || length(df) == 0) {
    return(list())
  }

  if (is.data.frame(df)) {
    return(lapply(seq_len(nrow(df)), function(i) {
      lapply(df, function(col) {
        if (is.data.frame(col)) {
          # A nested JSON object was parsed into a data.frame column.
          # `col[[i]]` would index by COLUMN, not row, and error out once
          # `i` exceeds ncol(col). Slice out row `i` instead, keeping it as
          # a one-row data.frame so downstream code (which already knows
          # how to walk data.frames/lists via extract_form_scalar()) works.
          as.list(col[i, , drop = FALSE])
        } else if (is.list(col)) {
          # A genuine list column: each element already corresponds to a row.
          col[[i]]
        } else {
          # A plain atomic vector column.
          col[[i]]
        }
      })
    }))
  }

  if (is.list(df) && !is.null(names(df))) {
    return(list(df))
  }

  df
}


extract_form_scalar <- function(x, default = NA) {
  if (is.null(x) || length(x) == 0) {
    return(default)
  }

  if (is.data.frame(x)) {
    return(extract_form_scalar(x[[1]][[1]], default = default))
  }

  if (is.list(x) && length(x) == 1) {
    return(extract_form_scalar(x[[1]], default = default))
  }

  x[[1]]
}


build_google_form_answer_name <- function(question_id, title) {
  readable_title <- title

  if (is.null(readable_title) || is.na(readable_title) || readable_title == "") {
    readable_title <- question_id
  }

  readable_title <- janitor::make_clean_names(readable_title)
  paste0(readable_title, "__", question_id, "_answers")
}


extract_question_metadata_rows <- function(item) {
  item_id <- as.character(extract_form_scalar(item$itemId, NA_character_))
  item_title <- as.character(extract_form_scalar(item$title, NA_character_))
  metadata_rows <- list()

  if (!is.null(item$questionItem) && !is.null(item$questionItem$question)) {
    question <- item$questionItem$question
    question_id <- as.character(extract_form_scalar(question$questionId, NA_character_))
    paragraph <- as.logical(extract_form_scalar(question$textQuestion$paragraph, NA))
    choice_question <- as.character(extract_form_scalar(question$choiceQuestion$type, NA_character_))

    metadata_rows[[length(metadata_rows) + 1]] <- data.frame(
      question_id = question_id,
      item_id = item_id,
      title = item_title,
      paragraph = paragraph,
      choice_question = choice_question,
      text_question = !is.na(paragraph),
      answer_column = build_google_form_answer_name(question_id, item_title),
      stringsAsFactors = FALSE,
      check.names = FALSE
    )
  }

  if (!is.null(item$questionGroupItem) && !is.null(item$questionGroupItem$questions)) {
    group_questions <- extract_google_form_rows(item$questionGroupItem$questions)

    for (question in group_questions) {
      question_id <- as.character(extract_form_scalar(question$questionId, NA_character_))
      row_title <- as.character(extract_form_scalar(question$rowQuestion$title, NA_character_))
      question_title <- item_title

      if (!is.na(row_title) && row_title != "") {
        question_title <- paste(item_title, row_title, sep = " - ")
      }

      metadata_rows[[length(metadata_rows) + 1]] <- data.frame(
        question_id = question_id,
        item_id = item_id,
        title = question_title,
        paragraph = as.logical(extract_form_scalar(question$textQuestion$paragraph, NA)),
        choice_question = as.character(extract_form_scalar(question$choiceQuestion$type, NA_character_)),
        text_question = !is.na(extract_form_scalar(question$textQuestion$paragraph, NA)),
        answer_column = build_google_form_answer_name(question_id, question_title),
        stringsAsFactors = FALSE,
        check.names = FALSE
      )
    }
  }

  metadata_rows
}


#' Google Form handling functions
#' @description This is a function to get metadata about a Google Form. It is
#'  used by the `get_google_form()` function if dataformat = "dataframe".
#' @param form_info The return form_info list that is extracted in `get_google_form()`
#' @returns This returns metadata from a google form
#' @export
get_question_metadata <- function(form_info) {
  item_rows <- extract_google_form_rows(form_info$result$items)

  if (length(item_rows) == 0) {
    return(data.frame())
  }

  metadata <- lapply(item_rows, extract_question_metadata_rows)
  metadata <- metadata[lengths(metadata) > 0]
  metadata <- unlist(metadata, recursive = FALSE, use.names = FALSE)

  if (length(metadata) == 0) {
    return(data.frame())
  }

  metadata <- dplyr::bind_rows(metadata)
  metadata <- metadata[!is.na(metadata$question_id), , drop = FALSE]
  rownames(metadata) <- NULL

  metadata
}

#' Google Form handling functions -- extracting answers
#' @description This is a function to get extract answers from a Google Form. It is
#'  used by the `get_google_form()` function if dataformat = "dataframe"
#' @param form_info The return form_info list that is extracted in `get_google_form()`
#' @param metadata Optional metadata returned by `get_question_metadata()`
#' @export
#' @returns This returns answers from a google form
extract_answers <- function(form_info, metadata = NULL) {
  responses <- extract_google_form_rows(form_info$response_info$result$responses)

  if (length(responses) == 0) {
    return(data.frame(value = "no responses yet"))
  }

  if (is.null(metadata)) {
    metadata <- get_question_metadata(form_info$form_metadata)
  }

  metadata_lookup <- stats::setNames(metadata$answer_column, metadata$question_id)

  collapse_text_answers <- function(answer) {
    answer_values <- answer$textAnswers$answers

    if (is.null(answer_values) || length(answer_values) == 0) {
      return(NA_character_)
    }

    if (is.data.frame(answer_values) && "value" %in% names(answer_values)) {
      values <- answer_values$value
    } else {
      values <- vapply(answer_values, function(single_answer) {
        as.character(extract_form_scalar(single_answer$value, NA_character_))
      }, character(1))
    }

    paste(values, collapse = "|")
  }

  collapse_file_upload_answers <- function(answer) {
    uploaded_files <- answer$fileUploadAnswers$answers

    if (is.null(uploaded_files) || length(uploaded_files) == 0) {
      return(NA_character_)
    }

    if (is.data.frame(uploaded_files)) {
      file_names <- uploaded_files$fileName
      if (is.null(file_names)) {
        file_names <- uploaded_files$fileId
      }
      return(paste(file_names, collapse = "|"))
    }

    file_names <- vapply(uploaded_files, function(single_file) {
      file_name <- extract_form_scalar(single_file$fileName, NA_character_)
      if (is.na(file_name)) {
        file_name <- extract_form_scalar(single_file$fileId, NA_character_)
      }
      as.character(file_name)
    }, character(1))

    paste(file_names, collapse = "|")
  }

  extract_single_answer <- function(answer) {
    if (!is.null(answer$textAnswers)) {
      return(collapse_text_answers(answer))
    }

    if (!is.null(answer$fileUploadAnswers)) {
      return(collapse_file_upload_answers(answer))
    }

    NA_character_
  }

  response_rows <- lapply(responses, function(response) {
    response_row <- list(
      response_id = as.character(extract_form_scalar(response$responseId, NA_character_))
    )

    answers <- response$answers

    if (!is.null(answers) && length(answers) > 0) {
      if (is.null(names(answers)) && !is.null(answers$questionId)) {
        answers <- list(answers)
        names(answers) <- as.character(extract_form_scalar(answers[[1]]$questionId, NA_character_))
      }

      for (answer in answers) {
        question_id <- as.character(extract_form_scalar(answer$questionId, NA_character_))

        # `metadata_lookup` is a named atomic vector, not a list, so using
        # `[[` with a name that isn't present throws "subscript out of
        # bounds" instead of returning NULL. Single-bracket indexing (`[`)
        # returns a length-1 named vector with NA when the name is missing,
        # which lets the fallback below actually run instead of crashing.
        answer_column <- metadata_lookup[question_id]

        if (is.null(answer_column) || is.na(answer_column)) {
          answer_column <- build_google_form_answer_name(question_id, question_id)
        } else {
          answer_column <- unname(answer_column)
        }

        response_row[[answer_column]] <- extract_single_answer(answer)
      }
    }

    response_row
  })

  info_df <- dplyr::bind_rows(response_rows)
  info_df <- as.data.frame(info_df, stringsAsFactors = FALSE, check.names = FALSE)

  info_df
}


google_pagination <- function(first_page_result) {
  # Set up a while loop for us to store the multiple page requests in
  cummulative_pages <- first_page_result$result$files
  page <- 1

  next_pg <- try(next_google(first_page_result), silent = TRUE)

  while (!grepl("Error", next_pg$result[1])) {
    cummulative_pages <- dplyr::bind_rows(cummulative_pages, next_pg$result$files)
    next_pg <- try(next_google(first_page_result), silent = TRUE)
    page <- page + 1
  }
  return(cummulative_pages)
}


next_google <- function(page_result) {
  body_params <- c(page_result$request_info$body_params,
    pageToken = page_result$result$nextPageToken
  )

  result <- request_google_forms(
    token = page_result$request_info$token,
    url = page_result$request_info$url,
    body_params = body_params,
    query_params = page_result$request_info$query_params,
    return_request = TRUE
  )

  return(result)
}
