mock_google_form_payload <- function() {
  form_metadata <- list(result = list(items = data.frame(
    itemId = c("item_q1", "item_q2", "item_note", "group_item", "item_upload"),
    title = c(
      "Favorite option",
      "Favorite pangram",
      "Section note",
      "Grid prompt",
      "Upload your files"
    ),
    questionItem = I(list(
      list(question = list(questionId = "304b2bf0", choiceQuestion = list(type = "RADIO"))),
      list(question = list(questionId = "60b89270", textQuestion = list(paragraph = TRUE))),
      NULL,
      NULL,
      list(question = list(questionId = "fileq1", fileUploadQuestion = list()))
    )),
    questionGroupItem = I(list(
      NULL,
      NULL,
      NULL,
      list(questions = data.frame(
        questionId = c("gridrow1", "gridrow2"),
        rowQuestion = I(list(
          list(title = "Row 1"),
          list(title = "Row 2")
        )),
        choiceQuestion = I(list(
          list(type = "RADIO"),
          list(type = "RADIO")
        )),
        stringsAsFactors = FALSE,
        check.names = FALSE
      )),
      NULL
    )),
    stringsAsFactors = FALSE,
    check.names = FALSE
  )))

  responses <- data.frame(
    responseId = c("resp1", "resp2"),
    answers = I(list(
      list(
        "304b2bf0" = list(
          questionId = "304b2bf0",
          textAnswers = list(answers = list(list(value = "Option A")))
        ),
        "60b89270" = list(
          questionId = "60b89270",
          textAnswers = list(answers = list(list(value = "The quick brown fox")))
        ),
        "gridrow1" = list(
          questionId = "gridrow1",
          textAnswers = list(answers = list(list(value = "Column 1")))
        ),
        "fileq1" = list(
          questionId = "fileq1",
          fileUploadAnswers = list(answers = list(
            list(fileName = "notes.txt"),
            list(fileName = "plot.png")
          ))
        )
      ),
      list(
        "304b2bf0" = list(
          questionId = "304b2bf0",
          textAnswers = list(answers = list(
            list(value = "Option B"),
            list(value = "Option C")
          ))
        ),
        "60b89270" = list(
          questionId = "60b89270",
          textAnswers = list(answers = data.frame(
            value = "Farmer Jack realized that big yellow quilts were expensive.",
            stringsAsFactors = FALSE
          ))
        ),
        "gridrow2" = list(
          questionId = "gridrow2",
          textAnswers = list(answers = list(list(value = "Column 2")))
        )
      )
    )),
    stringsAsFactors = FALSE,
    check.names = FALSE
  )

  list(
    form_metadata = form_metadata,
    response_info = list(result = list(responses = responses))
  )
}


test_that("Google Forms metadata uses question IDs and readable answer names", {
  payload <- mock_google_form_payload()
  metadata <- get_question_metadata(payload$form_metadata)

  expect_equal(
    metadata$question_id,
    c("304b2bf0", "60b89270", "gridrow1", "gridrow2", "fileq1")
  )
  expect_equal(
    metadata$item_id,
    c("item_q1", "item_q2", "group_item", "group_item", "item_upload")
  )
  expect_false("item_note" %in% metadata$item_id)
  expect_true(all(grepl("_answers$", metadata$answer_column)))
  expect_true(any(grepl("^favorite_option__", metadata$answer_column)))
  expect_true(any(grepl("^grid_prompt_row_1__", metadata$answer_column)))
})


test_that("Google Forms answers align to metadata and preserve readable names", {
  payload <- mock_google_form_payload()
  metadata <- get_question_metadata(payload$form_metadata)
  answers <- extract_answers(payload, metadata = metadata)

  favorite_option_col <- metadata$answer_column[metadata$question_id == "304b2bf0"]
  pangram_col <- metadata$answer_column[metadata$question_id == "60b89270"]
  upload_col <- metadata$answer_column[metadata$question_id == "fileq1"]

  expect_true(all(c("response_id", metadata$answer_column) %in% names(answers)))
  expect_false(any(grepl("^X", names(answers)[-1])))
  expect_equal(answers[[favorite_option_col]][1], "Option A")
  expect_equal(answers[[favorite_option_col]][2], "Option B|Option C")
  expect_equal(answers[[pangram_col]][1], "The quick brown fox")
  expect_equal(
    answers[[upload_col]][1],
    "notes.txt|plot.png"
  )
})


auth_tokens <-
  c(
    Sys.getenv("METRICMINER_GOOGLE_REFRESH"),
    Sys.getenv("METRICMINER_GOOGLE_ACCESS")
  )

if (all(!(auth_tokens == ""))) {
  test_that("Google Forms: Get form", {
    # auth from secret
    auth_from_secret("google",
      refresh_token = Sys.getenv("METRICMINER_GOOGLE_REFRESH"),
      access_token = Sys.getenv("METRICMINER_GOOGLE_ACCESS"),
      cache = FALSE,
      in_test = TRUE
    )

    form_info <- get_google_form(
      "https://docs.google.com/forms/d/1Neyj7wwNpn8wC7NzQND8kQ30cnbbETSpT0lKhX7uaQY/edit"
    )

    expect_named(form_info, c("title", "metadata", "answers"))
  })

  test_that("Google Forms: Get multiple forms", {
    # auth from secret
    auth_from_secret("google",
      refresh_token = Sys.getenv("METRICMINER_GOOGLE_REFRESH"),
      access_token = Sys.getenv("METRICMINER_GOOGLE_ACCESS"),
      cache = FALSE,
      in_test = TRUE
    )

    form_ids <- c(
      "1Neyj7wwNpn8wC7NzQND8kQ30cnbbETSpT0lKhX7uaQY",
      "1Neyj7wwNpn8wC7NzQND8kQ30cnbbETSpT0lKhX7uaQY"
    )

    multiple_forms <- get_multiple_forms(form_ids = form_ids)

    expect_named(
      multiple_forms$contribute_to_itcr_training_network,
      c("title", "metadata", "answers")
    )
  })
} else {
  message("testthat tests skipped because no auth detected")
}
