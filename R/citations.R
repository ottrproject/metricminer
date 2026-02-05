#' GET and check response
#' @description This is a function that given a URL uses GET to send a request and then will check the response to make sure the status code reflects data was returned or the request was ok/successful.
#' @param paper_cite_link the citation link provided to `get_citation_count` perhaps with a start parameter included
#' @return the response or stop the process

request_and_check <- function(paper_cite_link){
  
  response <- httr::GET(paper_cite_link)
  
  if (httr::status_code(response) != 200) {
    httr::stop_for_status(response)
  } else{
    return(response)
  }
  
}

#' Parse the response to extract titles of papers that cite your paper
#' @description This function takes the response from `request_and_check()` and parses it to extract specifically the displayed titles of the papers
#' @param response the response from `request_and_check()` with the HTML
#' @return a vector of paper titles

parse_titles <- function(response){
  
  cite_titles <- rvest::read_html(httr::content(response, "text")) %>%
    rvest::html_nodes('h3') %>%
    rvest::html_text()
  
  return(cite_titles)
  
}

#' Parse the response to extract journals and publication years for papers that cite your paper
#' @description This function takes the response from `request_and_check()` and parses it to extract specifically the displayed journals and publication years
#' @param response the response from `request_and_check()` with the HTML
#' @return a named list with vector of journal names ('journal') and a vector of publication years ('pubyr')

parse_journal_year <- function(response){
  
  journal_year <- rvest::read_html(httr::content(response, "text")) %>%
    rvest::html_nodes('.gs_a') %>% #author information
    rvest::html_text() %>%
    strsplit(, split = "-") %>% #split at the dash
    sapply(., function(x) x[length(x) - 1]) #retrieve next to last since last is url
  
  journals <- journal_year %>%
    strsplit(, split = ", ") %>% 
    sapply(., function(x) x[1]) %>%
    trimws()
  
  years <- journal_year %>%
    strsplit(, split = ", ") %>% 
    sapply(., function(x) x[2]) %>%
    trimws()
  
  return(journal_year_info = list('journal' = journals, 'pubyr' = years))
  
}

#' Parse the response to extract links of papers that cite your paper
#' @description This function takes the response from `request_and_check()` and parses it to extract specifically the displayed links of the papers
#' @param response the response from `request_and_check()` with the HTML
#' @return a vector of links

parse_links <- function(response){
  
  links <- rvest::read_html(paper_cite_link) %>%
    rvest::html_nodes('h3') %>%
    rvest::html_nodes("a") %>%
    rvest::html_attr("href")
  
  return(links)
  
}

#' Check to see if the response suspects I am a robot
#' @description This function looks at the first header to see if my request is suspected to be from a robot
#' @param response the response from `request_and_check()` with the HTML
#' @return a boolean TRUE for it has decided I may be a robot and FALSE for it has not seemed to decide that

me_robot <- function(response){
  
  h1 <- rvest::read_html(httr::content(response, "text")) %>%
    rvest::html_elements("h1")
  
  if (length(h1) > 0){
    return(stringr::str_detect(rvest::html_text(h1), "robot"))
  } else{
    return(FALSE)
  }
}

#' Get a list of papers that cite your paper
#' @description This is a function to retrieve a list of papers that cite your papers
#' @param paper_cite_link This is not a google citation page. 1. Go to: https://scholar.google.com/scholar 2. Search for the paper we are looking for the citation count. 3. Then click the Cited by ___ button below the title of the paper 4. Copy and paste this url and put it in this get_citation_count() function
#' @param sleeptime a time in seconds to use sys.sleep between http requests to try to avoid Google Scholar rate limit; default is 30
#' @export
#' @return A list of the example datasets available in this package
#' @examples \dontrun{
#'
#' paper_cite_link <- "https://scholar.google.com/scholar?cites=6140457238337460780"
#'
#' papers_cited_df <- get_citation_count(paper_cite_link)
#' }
get_citation_count <- function(paper_cite_link, sleeptime = 30) {

  base_url <- "https://scholar.google.com/scholar?cites="

  is_cite_page <- grepl(base_url, paper_cite_link, fixed = TRUE)

  if (!is_cite_page) {
    stop("This is not a google citation page. \n",
         "1. Go to: https://scholar.google.com/scholar \n",
         "2. Search for the paper we are looking for the citation count. \n",
         "3. Then click the Cited by ___ button below the title of the paper \n",
         "4. Copy and paste this url and put it in this get_citation_count() function")
  }

  response <- request_and_check(paper_cite_link)
  print("response received from Google Scholar for page 1")

  print(paste0("suspected robot: ", me_robot(response)))

  #--------- Traverse pages -----------
  
  page_start <- 0
  next_page <- TRUE
  
  original_paper_vec <- c()
  cite_titles_vec <- c()
  journals_vec <- c()
  pubyrs_vec <- c()
  links_vec <- c()
  
  ## start while loop that we'll stop when we're done with the last page
  while (next_page == TRUE){
    
    # first page is the only one that needs to get the original paper info
    if (page_start == 0){
      original_paper <- rvest::read_html(httr::content(response, "text")) %>%
        rvest::html_nodes('h2.gs_rt') %>%
        rvest::html_text()
      
      original_paper_vec <- c(original_paper)
    }
    
    ## concatenate these with overall storage vectors
    if (me_robot(response) == FALSE){
      cite_titles_vec <- c(cite_titles_vec, parse_titles(response))
      journal_year_info <- parse_journal_year(response)
      journals_vec <- c(journals_vec, unname(unlist(journal_year_info["journal"])))
      pubyrs_vec <- c(pubyrs_vec, unname(unlist(journal_year_info["pubyr"])))
      links_vec <- c(links_vec, parse_links(response))
    }
    
    next_button <- rvest::read_html(httr::content(response, "text")) %>%
      rvest::html_elements("button.gs_btnPR") %>% 
      rvest::html_attr("onclick")
    
    ##check if next button is available and proceed depending on that
    if(!is.na(next_button)){
      ##adjust page counter
      page_start <- page_start + 10
      paper_cite_link_next <- paste0(paper_cite_link, "&start=", page_start)
    } else{
      # time to leave while loop
      next_page = FALSE
    }
    
    #add sleep step
    Sys.sleep(sleeptime)
    
    #get new response
    response <- request_and_check(paper_cite_link_next)
    print(paste0("response received from Google Scholar for page ", page_start / 10 + 1))
    
    if(me_robot(response) == TRUE){
      print(paste0("suspected robot so waiting ", sleeptime, " seconds to retry"))
      Sys.sleep(sleeptime)
      response <- request_and_check(paper_cite_link_next)
      print(paste0("response received from Google Scholar for page ", page_start / 10 + 1))
      if(me_robot(response) == TRUE){
        print("still suspected as robot")
        # time to leave while loop
        next_page = FALSE
      }
    }
  }
  
  
  df <- data.frame(original_paper_vec, cite_titles_vec, links_vec, journals_vec, pubyrs_vec)
  return(df)
}
