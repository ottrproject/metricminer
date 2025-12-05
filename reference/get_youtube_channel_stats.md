# Get Youtube channel stats

This is a function to retrieve statistics for a Youtube channel

## Usage

``` r
get_youtube_channel_stats(channel_id, token = NULL, dataformat = "dataframe")
```

## Arguments

- channel_id:

  ID of the Youtube channel to retrieve stats from.

- token:

  OAuth token from Google login.

- dataformat:

  How would you like the data returned to you? Default is a "dataframe"
  but if you'd like to see the original API list result, put "raw".

## Value

A data frame of the channel stats from a Youtube channel.

## Examples

``` r
if (FALSE) { # \dontrun{

authorize("google")
youtube_channel_stats <- get_youtube_channel_stats("UCr73I9ZEPbn-3_1CBM57QgQ")
} # }
```
