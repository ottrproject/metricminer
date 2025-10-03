test_that("citations pulled", {

  testthat::skip_on_cran()
  
  auth_from_secret("google",
      refresh_token = Sys.getenv("METRICMINER_GOOGLE_REFRESH"),
      access_token = Sys.getenv("METRICMINER_GOOGLE_ACCESS"),
      cache = FALSE,
      in_test = TRUE
    )
  
  paper_cite_link <- "https://scholar.google.com/scholar?cites=6140457238337460780"

  papers_cited_df <- get_citation_count(paper_cite_link)

  testthat::expect_named(papers_cited_df, c('original_paper', 'cite_titles', 'links'))
})
