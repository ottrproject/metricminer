# Get a list of papers that cite your paper

This is a function to retrieve a list of papers that cite your papers

## Usage

``` r
get_citation_count(paper_cite_link)
```

## Arguments

- paper_cite_link:

  This is not a google citation page. 1. Go to:
  https://scholar.google.com/scholar 2. Search for the paper we are
  looking for the citation count. 3. Then click the Cited by \_\_\_
  button below the title of the paper 4. Copy and paste this url and put
  it in this get_citation_count() function

## Value

A list of the example datasets available in this package

## Examples

``` r
if (FALSE) { # \dontrun{

paper_cite_link <- "https://scholar.google.com/scholar?cites=6140457238337460780"

papers_cited_df <- get_citation_count(paper_cite_link)
} # }
```
