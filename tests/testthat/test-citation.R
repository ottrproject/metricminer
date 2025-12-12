auth_tokens <-
  c(
    Sys.getenv("METRICMINER_GOOGLE_REFRESH"),
    Sys.getenv("METRICMINER_GOOGLE_ACCESS")
  )

if (all(!(auth_tokens == ""))) {

  test_that("citations pulled", {
    # Interactively create google token
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

} else {
  message("testthat tests skipped because no auth detected")
}
