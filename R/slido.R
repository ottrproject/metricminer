# Extract data from a Sli.Do sheet that is on Googledrive


#' Get Slido Files
#' @description This is a function to get slido response output files.
#' The slido files must be saved as googlesheets and cannot be xlsx.
#' The scope it uses is to `view and manage your Drive files' the `See, edit, create, and delete all your Google Sheets spreadsheets.`
#' However, the user will need to authorize their google account twice (once for googledrive and once for googlesheets)
#' If you don't check these boxes on the OAuth screens, this function won't work.
#' @param shared_drive_name a name of a shared drive (not a URL or subpart of a URL) (will recursively search for files by default).
#' @param tags_to_find pattern or character that's a regular expression to look for in file names. Default is "^Polls-per|^JoinedParticipants-" which will search for files starting with either of those patterns.
#' @param file_type which file type to search for. Default is "spreadsheet"
#' @param keep_duplicates By default we won't keep duplicated files if a two files have the same name. But if you set this to true, duplicates will be returned.
#' @return A list of the slido files and their content in a Googledrive location.
#' @import dplyr
#' @importFrom googledrive as_id drive_find drive_auth
#' @importFrom googlesheets4 read_sheet
#' @export
#'
#' @examples \dontrun{
#'
#' shared_drive_name <- "ITCR"
#' slido_data <- get_slido_files(shared_drive_name)
#' }
get_slido_files <- function(shared_drive_name, tags_to_find = "^Polls-per|^JoinedParticipants-", file_type = "spreadsheet", keep_duplicates = FALSE) {

  googledrive::drive_auth()

  spreadsheet_list <- drive_find(tags_to_find, type=file_type, shared_drive = shared_drive_name)

  if (length(spreadsheet_list) == 0) {
    stop("No slido associated spreadsheets found in the shared drive for the name provided")
  }

  file_info <- data.frame(
    file_name = spreadsheet_list$name,
    id = spreadsheet_list$id
  )

  slido_tags <- c(
    "^JoinedParticipants-",
    "^Leaderboard-",
    "^Polls-overall-",
    "^Replies-",
    "^Polls-per-user-",
    "^Polls-per-participant-",
    "^Questions-"
  )

  # Extract slido file names
  slido_regex <- paste0(slido_tags, collapse = "|")
  slido_file_names <- grep(slido_regex, file_info$file_name, value = TRUE)

  # Get slido event names (basically everything that isn't a slido tag)
  slido_event_name <- stringr::word(slido_file_names, sep = slido_regex, start = 2)

  # Now extract which slido tag was in each
  event_names_regex <- paste0(slido_event_name, collapse = "|")
  slido_type <- stringr::word(slido_file_names, sep = event_names_regex, start = 1)
  slido_type <- gsub("-$", "", slido_type)
  slido_type <- gsub("Polls-per-user", "Polls-per-participant", slido_type)

  # Set up data frame
  slido_files <- file_info %>%
    dplyr::filter(file_name %in% slido_file_names) %>%
    dplyr::mutate(
      slido_event_name,
      slido_type
    ) %>%
    dplyr::arrange(slido_type)

  if (!keep_duplicates) {
    slido_files <-
      dplyr::distinct(slido_files, slido_event_name, slido_type, .keep_all = TRUE)
  }

  # Now read in the data
  slido_data <- sapply(unique(slido_files$slido_type), function(slido_type_name) {
    files <- slido_files %>%
      dplyr::filter(slido_type == slido_type_name)

    if (length(files) > 0) {
      slido_data <- lapply(files$id, function(file) {
        headers <- googlesheets4::read_sheet(file, n_max = 1)

        if (length(colnames(headers)) > 1) {
          return(googlesheets4::read_sheet(file, col_names = colnames(headers), skip = 2))
        }
      })


      names(slido_data) <- files$slido_event_name

      slido_data_length <- sapply(slido_data, length)

      slido_data_df <- dplyr::bind_rows(slido_data, .id = "event_name")
    }
    return(slido_data_df)
  }, USE.NAMES = TRUE)

  return(slido_data)
}
