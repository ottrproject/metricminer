# Get Youtube video stats

This is a function to get a statistics on a Youtube video

## Usage

``` r
get_youtube_video_stats(video_id, token = NULL, dataformat = "dataframe")
```

## Arguments

- video_id:

  ID of the Youtube video to retrieve stats from.

- token:

  OAuth token from Google login.
  https://www.youtube.com/watch?v=YkYnni-WuaQor just the "YkYnni-WuaQor"
  part that comes after the \`v=\` bit.

- dataformat:

  How would you like the data returned to you? Default is a "dataframe"
  but if you'd like to see the original API list result, put "raw".

## Value

A data frame of the Youtube video stats.

## Examples

``` r
if (FALSE) { # \dontrun{

authorize("google")
youtube_video_stats <- get_youtube_video_stats("YkYnni-WuaQ")
} # }
```
