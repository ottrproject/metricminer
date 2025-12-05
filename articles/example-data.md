# example-data

## Example metricminer data

``` r
library("metricminer")
```

### Calendly Data Examples

[Read more about the calendly API docs
here](https://developer.calendly.com/api-docs).

#### User

[`get_calendly_user()`](../reference/get_calendly_user.md) returns this
type of data.

``` r
get_example_data("calendly_user")
class(calendly_user)
#> [1] "list"
str(calendly_user)
#> List of 1
#>  $ resource:List of 11
#>   ..$ avatar_url          : NULL
#>   ..$ created_at          : chr "2024-01-10T14:27:55.401328Z"
#>   ..$ current_organization: chr "https://api.calendly.com/organizations/5ee3fa72-be7d-4317-a62d-3fce220181bc"
#>   ..$ email               : chr "metricminersoftware@gmail.com"
#>   ..$ name                : chr "metric miner"
#>   ..$ resource_type       : chr "User"
#>   ..$ scheduling_url      : chr "https://calendly.com/metricminersoftware"
#>   ..$ slug                : chr "metricminersoftware"
#>   ..$ timezone            : chr "America/New_York"
#>   ..$ updated_at          : chr "2024-01-17T20:39:05.726564Z"
#>   ..$ uri                 : chr "https://api.calendly.com/users/04a7ab8e-dd1d-4938-959f-0f8441fae3e5"
```

#### Events

[`list_calendly_events()`](../reference/list_calendly_events.md) returns
this type of data.

``` r
get_example_data("calendly_events")
class(calendly_events)
#> [1] "data.frame"
str(calendly_events)
#> 'data.frame':    1 obs. of  13 variables:
#>  $ calendar_event   :'data.frame':   1 obs. of  2 variables:
#>   ..$ external_id: chr "mvfp068bjc6dr3r6cdsmnqbme0"
#>   ..$ kind       : chr "google"
#>  $ created_at       : chr "2024-01-10T14:29:21.506145Z"
#>  $ end_time         : chr "2024-01-17T14:30:00.000000Z"
#>  $ event_guests     :List of 1
#>   ..$ : list()
#>  $ event_memberships:List of 1
#>   ..$ :'data.frame': 1 obs. of  3 variables:
#>   .. ..$ user      : chr "https://api.calendly.com/users/04a7ab8e-dd1d-4938-959f-0f8441fae3e5"
#>   .. ..$ user_email: chr "metricminersoftware@gmail.com"
#>   .. ..$ user_name : chr "metric miner"
#>  $ event_type       : chr "https://api.calendly.com/event_types/d39d7211-9c78-4121-8271-208cfaa34989"
#>  $ invitees_counter :'data.frame':   1 obs. of  3 variables:
#>   ..$ active: int 1
#>   ..$ limit : int 1
#>   ..$ total : int 1
#>  $ location         :'data.frame':   1 obs. of  2 variables:
#>   ..$ location: logi NA
#>   ..$ type    : chr "custom"
#>  $ name             : chr "30 Minute Meeting"
#>  $ start_time       : chr "2024-01-17T14:00:00.000000Z"
#>  $ status           : chr "active"
#>  $ updated_at       : chr "2024-01-10T14:29:22.796821Z"
#>  $ uri              : chr "https://api.calendly.com/scheduled_events/ac7a3d65-37ee-4277-a057-c308bdc7a067"
```

### GitHub Data Examples

[Read more about the GitHub API here](https://docs.github.com/en/rest).

#### Github user

[`get_github_user()`](../reference/get_github_user.md) returns this type
of data.

``` r
get_example_data("gh_user")
class(gh_user)
#> [1] "list"
str(gh_user)
#> List of 32
#>  $ login              : chr "cansavvy"
#>  $ id                 : int 23458084
#>  $ node_id            : chr "MDQ6VXNlcjIzNDU4MDg0"
#>  $ avatar_url         : chr "https://avatars.githubusercontent.com/u/23458084?v=4"
#>  $ gravatar_id        : chr ""
#>  $ url                : chr "https://api.github.com/users/cansavvy"
#>  $ html_url           : chr "https://github.com/cansavvy"
#>  $ followers_url      : chr "https://api.github.com/users/cansavvy/followers"
#>  $ following_url      : chr "https://api.github.com/users/cansavvy/following{/other_user}"
#>  $ gists_url          : chr "https://api.github.com/users/cansavvy/gists{/gist_id}"
#>  $ starred_url        : chr "https://api.github.com/users/cansavvy/starred{/owner}{/repo}"
#>  $ subscriptions_url  : chr "https://api.github.com/users/cansavvy/subscriptions"
#>  $ organizations_url  : chr "https://api.github.com/users/cansavvy/orgs"
#>  $ repos_url          : chr "https://api.github.com/users/cansavvy/repos"
#>  $ events_url         : chr "https://api.github.com/users/cansavvy/events{/privacy}"
#>  $ received_events_url: chr "https://api.github.com/users/cansavvy/received_events"
#>  $ type               : chr "User"
#>  $ site_admin         : logi FALSE
#>  $ name               : chr "Candace Savonen"
#>  $ company            : chr "Fred Hutchinson Cancer Center"
#>  $ blog               : chr "www.cansavvy.com"
#>  $ location           : NULL
#>  $ email              : chr "cansav09@gmail.com"
#>  $ hireable           : NULL
#>  $ bio                : NULL
#>  $ twitter_username   : chr "cansavvy"
#>  $ public_repos       : int 33
#>  $ public_gists       : int 0
#>  $ followers          : int 20
#>  $ following          : int 39
#>  $ created_at         : chr "2016-11-14T16:20:54Z"
#>  $ updated_at         : chr "2024-01-18T13:54:29Z"
```

#### Github repository list

[`get_user_repo_list()`](../reference/get_user_repo_list.md) returns
this type of data.

``` r
get_example_data("gh_repo_list")
class(gh_repo_list)
#> [1] "data.frame"
str(gh_repo_list)
#> 'data.frame':    2 obs. of  6 variables:
#>  $ name            : chr  "metricminer/dummy-website" "metricminer/my-cool-repo"
#>  $ url             : chr  "https://api.github.com/repos/metricminer/dummy-website" "https://api.github.com/repos/metricminer/my-cool-repo"
#>  $ open_issues     : int  0 0
#>  $ visibility      : chr  "public" "public"
#>  $ stargazers_count: int  0 0
#>  $ watchers_count  : int  0 0
```

#### GitHub repository metrics

[`get_github_repo_summary()`](../reference/get_github_repo_summary.md)
returns this kind of data.

``` r
get_example_data("gh_repo_summary_metrics")
class(gh_repo_summary_metrics)
#> [1] "data.frame"
str(gh_repo_summary_metrics)
#> 'data.frame':    1 obs. of  6 variables:
#>  $ repo_name          : chr "metricminer/my-cool-repo"
#>  $ num_forks          : logi NA
#>  $ num_contributors   : int 2
#>  $ total_contributions: int 3
#>  $ num_stars          : int 0
#>  $ health_percentage  : num 14
```

[`get_github_repo_timecourse()`](../reference/get_github_repo_timecourse.md)
returns this kind of data.

``` r
get_example_data("gh_repo_timecourse_metrics")
class(gh_repo_timecourse_metrics)
#> [1] "tbl_df"     "tbl"        "data.frame"
str(gh_repo_timecourse_metrics)
#> tibble [5 × 5] (S3: tbl_df/tbl/data.frame)
#>  $ timestamp     : Date[1:5], format: "2024-01-11" "2024-01-15" ...
#>  $ count_clones  : num [1:5] 28 1 1 1 NA
#>  $ uniques_clones: num [1:5] 14 1 1 1 NA
#>  $ count_views   : num [1:5] 32 NA NA NA 5
#>  $ uniques_views : num [1:5] 2 NA NA NA 1
```

#### Multiple GitHub repositories metrics

[`get_multiple_repos_metrics()`](../reference/get_multiple_repos_metrics.md)
returns this kind of data.

``` r
get_example_data("gh_repos_metrics")
class(gh_repos_metrics)
#> [1] "data.frame"
str(gh_repos_metrics)
#> 'data.frame':    2 obs. of  8 variables:
#>  $ repo_name          : chr  "fhdsl/metricminer" "jhudsl/OTTR_Template"
#>  $ num_forks          : int  NA 11
#>  $ num_contributors   : int  4 14
#>  $ total_contributions: int  288 883
#>  $ num_stars          : int  1 15
#>  $ health_percentage  : num  37 62
#>  $ num_clones         : logi  NA NA
#>  $ unique_views       : logi  NA NA
```

### Google Analytics Examples

[Read more about the Google Analytics API
here](https://developers.google.com/analytics/devguides/reporting/data/v1).

#### GA user info

[`get_ga_user()`](../reference/get_ga_user.md) returns this kind of
data.

``` r
get_example_data("ga_user")
class(ga_user)
#> [1] "data.frame"
str(ga_user)
#> 'data.frame':    1 obs. of  4 variables:
#>  $ id           : chr "298328772"
#>  $ kind         : chr "analytics#accountSummary"
#>  $ name         : chr "dummy"
#>  $ webProperties:List of 1
#>   ..$ : list()
```

#### GA properties

[`get_ga_properties()`](../reference/get_ga_properties.md) returns this
kind of data.

``` r
get_example_data("ga_properties")
class(ga_properties)
#> [1] "data.frame"
str(ga_properties)
#> 'data.frame':    2 obs. of  11 variables:
#>  $ name            : chr  "properties/422558989" "properties/422671031"
#>  $ parent          : chr  "accounts/298328772" "accounts/298328772"
#>  $ createTime      : chr  "2024-01-10T14:35:20.752Z" "2024-01-11T13:16:53.939Z"
#>  $ updateTime      : chr  "2024-01-11T13:19:55.057Z" "2024-01-11T13:16:53.939Z"
#>  $ displayName     : chr  "dummy-website" "dummy-website-2"
#>  $ industryCategory: chr  "TECHNOLOGY" "TECHNOLOGY"
#>  $ timeZone        : chr  "America/Los_Angeles" "America/Los_Angeles"
#>  $ currencyCode    : chr  "USD" "USD"
#>  $ serviceLevel    : chr  "GOOGLE_ANALYTICS_STANDARD" "GOOGLE_ANALYTICS_STANDARD"
#>  $ account         : chr  "accounts/298328772" "accounts/298328772"
#>  $ propertyType    : chr  "PROPERTY_TYPE_ORDINARY" "PROPERTY_TYPE_ORDINARY"
```

#### GA property metadata

[`get_ga_metadata()`](../reference/get_ga_metadata.md) returns this kind
of data.

``` r
get_example_data("ga_property_metadata")
class(ga_property_metadata)
#> [1] "list"
str(ga_property_metadata)
#> List of 3
#>  $ dimensions:'data.frame':  194 obs. of  5 variables:
#>   ..$ apiName           : chr [1:194] "achievementId" "adFormat" "adSourceName" "adUnitName" ...
#>   ..$ uiName            : chr [1:194] "Achievement ID" "Ad format" "Ad source" "Ad unit" ...
#>   ..$ description       : chr [1:194] "The achievement ID in a game for an event. Populated by the event parameter 'achievement_id'." "Describes the way ads looked and where they were located. Typical formats include 'Interstitial', 'Banner', 'Re"| __truncated__ "The source network that served the ad. Typical sources include 'AdMob Network', 'Liftoff', 'Facebook Audience N"| __truncated__ "The name you chose to describe this Ad unit. Ad units are containers you place in your apps to show ads to users." ...
#>   ..$ category          : chr [1:194] "Other" "Publisher" "Publisher" "Publisher" ...
#>   ..$ deprecatedApiNames:List of 194
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : chr "countryIsoCode"
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : chr "dayOfWeekZero"
#>   .. ..$ : NULL
#>   .. ..$ : chr "defaultChannelGrouping"
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : chr "firstTouchDate"
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : chr "firstUserDefaultChannelGrouping"
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : chr "firstUserCreativeId"
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : chr "firstUserTrafficOrigin"
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. .. [list output truncated]
#>  $ metrics   :'data.frame':  89 obs. of  6 variables:
#>   ..$ apiName           : chr [1:89] "active1DayUsers" "active28DayUsers" "active7DayUsers" "activeUsers" ...
#>   ..$ uiName            : chr [1:89] "1-day active users" "28-day active users" "7-day active users" "Active users" ...
#>   ..$ description       : chr [1:89] "The number of distinct active users on your site or app within a 1 day period. The 1 day period includes the la"| __truncated__ "The number of distinct active users on your site or app within a 28 day period. The 28 day period includes the "| __truncated__ "The number of distinct active users on your site or app within a 7 day period. The 7 day period includes the la"| __truncated__ "The number of distinct users who visited your site or app." ...
#>   ..$ type              : chr [1:89] "TYPE_INTEGER" "TYPE_INTEGER" "TYPE_INTEGER" "TYPE_INTEGER" ...
#>   ..$ category          : chr [1:89] "User" "User" "User" "User" ...
#>   ..$ deprecatedApiNames:List of 89
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : chr "adUnitExposureMs"
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : chr "itemListClicks"
#>   .. ..$ : NULL
#>   .. ..$ : chr "itemListViews"
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : chr "itemPurchaseQuantity"
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : chr "itemViews"
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : chr "itemPromotionClicks"
#>   .. ..$ : chr "itemPromotionViews"
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>   .. ..$ : NULL
#>  $ name      : chr "properties/422558989/metadata"
```

#### GA property metrics

[`get_ga_stats()`](../reference/get_ga_stats.md) when
`stats_type = "metrics"` returns this kind of data.

``` r
get_example_data("ga_metrics")
class(ga_metrics)
#> [1] "data.frame"
str(ga_metrics)
#> 'data.frame':    1 obs. of  10 variables:
#>  $ website               : chr "1"
#>  $ activeUsers           : num 4
#>  $ newUsers              : num 4
#>  $ totalUsers            : num 4
#>  $ eventCountPerUser     : num 15
#>  $ screenPageViewsPerUser: num 4.25
#>  $ sessions              : num 6
#>  $ averageSessionDuration: num 55
#>  $ screenPageViews       : num 17
#>  $ engagementRate        : num 0.667
```

#### GA property dimensions

[`get_ga_stats()`](../reference/get_ga_stats.md) when
`stats_type = "dimensions"` returns this kind of data.

``` r
get_example_data("ga_dimensions")
class(ga_dimensions)
#> [1] "data.frame"
str(ga_dimensions)
#> 'data.frame':    3 obs. of  5 variables:
#>  $ day        : chr  "10" "10" "10"
#>  $ month      : chr  "01" "01" "01"
#>  $ year       : chr  "2024" "2024" "2024"
#>  $ country    : chr  "Germany" "Russia" "United States"
#>  $ fullPageUrl: chr  "metricminer.github.io/dummy-website/" "metricminer.github.io/dummy-website/" "metricminer.github.io/dummy-website/"
```

#### GA property link clicks

[`get_ga_stats()`](../reference/get_ga_stats.md) when
`stats_type = "link_clicks"` returns this kind of data.

``` r
get_example_data("ga_link_clicks")
class(ga_link_clicks)
#> [1] "data.frame"
str(ga_link_clicks)
#> 'data.frame':    2 obs. of  1 variable:
#>  $ linkUrl: chr  "" "https://www.metricminer.org/"
```

#### Bulk retrieval of GA property metrics/dims/link clicks

`get_all_ga_metrics()` returns this kind of data.

``` r
get_example_data("ga_all_metrics")
class(ga_all_metrics )
#> [1] "list"
str(ga_all_metrics)
#> List of 3
#>  $ metrics    :'data.frame': 2 obs. of  10 variables:
#>   ..$ website               : chr [1:2] "dummy-website" "dummy-website-2"
#>   ..$ activeUsers           : num [1:2] 4 2
#>   ..$ newUsers              : num [1:2] 4 2
#>   ..$ totalUsers            : num [1:2] 4 2
#>   ..$ eventCountPerUser     : num [1:2] 15 4
#>   ..$ screenPageViewsPerUser: num [1:2] 4.25 1
#>   ..$ sessions              : num [1:2] 6 2
#>   ..$ averageSessionDuration: num [1:2] 54.99 4.62
#>   ..$ screenPageViews       : num [1:2] 17 2
#>   ..$ engagementRate        : num [1:2] 0.667 0
#>  $ dimensions :'data.frame': 10 obs. of  2 variables:
#>   ..$ website: chr [1:10] "1" "2" "3" "4" ...
#>   ..$ dims   : chr [1:10] "No data collected yet" "No data collected yet" "No data collected yet" "No data collected yet" ...
#>  $ link_clicks:'data.frame': 3 obs. of  2 variables:
#>   ..$ website: chr [1:3] "dummy-website" "dummy-website" "dummy-website-2"
#>   ..$ linkUrl: chr [1:3] "" "https://www.metricminer.org/" ""
```

### Google Form Examples

[Read more about the Google Form API
here](https://developers.google.com/forms/api/reference/rest).

#### Single google form

[`get_google_form()`](../reference/get_google_form.md) returns this kind
of data.

``` r
get_example_data("gform_info")
class(gform_info)
#> [1] "list"
str(gform_info)
#> List of 3
#>  $ title   : chr "A cool survey"
#>  $ metadata:'data.frame':    2 obs. of  5 variables:
#>   ..$ question_id    : chr [1:2] "3eec4d94" "4d071789"
#>   ..$ title          : chr [1:2] "What option do you like best? " "Can write a paragraph?"
#>   ..$ paragraph      : logi [1:2] NA TRUE
#>   ..$ choice_question: chr [1:2] "RADIO" NA
#>   ..$ text_question  : logi [1:2] FALSE TRUE
#>  $ answers :'data.frame':    4 obs. of  3 variables:
#>   ..$ reponse_id       : chr [1:4] "ACYDBNh5anwjnKXjVUMA6E0yxnwEIZYhatDkyAMppk3k4gITBFhwdDEbL6GldJjNPigPH8s" "ACYDBNifvH8F3H9as35PWPwQapCyaUyRQnXiv2HFOXV1oeTyxAuj77-JJk5eMYkCNSNYZZs" "ACYDBNh5anwjnKXjVUMA6E0yxnwEIZYhatDkyAMppk3k4gITBFhwdDEbL6GldJjNPigPH8s" "ACYDBNifvH8F3H9as35PWPwQapCyaUyRQnXiv2HFOXV1oeTyxAuj77-JJk5eMYkCNSNYZZs"
#>   ..$ X103e69c2_answers: chr [1:4] "Here's another really cool response. Your mind is blown." "Here's some more words" "Here's another really cool response. Your mind is blown." "Here's some more words"
#>   ..$ X7a10555e_answers: chr [1:4] "Option B" "Option A" "Option B" "Option A"
```

#### Multiple forms info and responses

[`get_multiple_forms()`](../reference/get_multiple_forms.md) returns
this kind of data.

``` r
get_example_data("gforms_multiple")
class(gforms_multiple)
#> [1] "list"
str(gforms_multiple)
#> List of 2
#>  $ a_cool_survey             :List of 3
#>   ..$ title   : chr "A cool survey"
#>   ..$ metadata:'data.frame': 2 obs. of  5 variables:
#>   .. ..$ question_id    : chr [1:2] "3eec4d94" "4d071789"
#>   .. ..$ title          : chr [1:2] "What option do you like best? " "Can write a paragraph?"
#>   .. ..$ paragraph      : logi [1:2] NA TRUE
#>   .. ..$ choice_question: chr [1:2] "RADIO" NA
#>   .. ..$ text_question  : logi [1:2] FALSE TRUE
#>   ..$ answers :'data.frame': 4 obs. of  3 variables:
#>   .. ..$ reponse_id       : chr [1:4] "ACYDBNh5anwjnKXjVUMA6E0yxnwEIZYhatDkyAMppk3k4gITBFhwdDEbL6GldJjNPigPH8s" "ACYDBNifvH8F3H9as35PWPwQapCyaUyRQnXiv2HFOXV1oeTyxAuj77-JJk5eMYkCNSNYZZs" "ACYDBNh5anwjnKXjVUMA6E0yxnwEIZYhatDkyAMppk3k4gITBFhwdDEbL6GldJjNPigPH8s" "ACYDBNifvH8F3H9as35PWPwQapCyaUyRQnXiv2HFOXV1oeTyxAuj77-JJk5eMYkCNSNYZZs"
#>   .. ..$ X103e69c2_answers: chr [1:4] "Here's another really cool response. Your mind is blown." "Here's some more words" "Here's another really cool response. Your mind is blown." "Here's some more words"
#>   .. ..$ X7a10555e_answers: chr [1:4] "Option B" "Option A" "Option B" "Option A"
#>  $ another_even_cooler_survey:List of 3
#>   ..$ title   : chr "Another even cooler survey"
#>   ..$ metadata:'data.frame': 2 obs. of  5 variables:
#>   .. ..$ question_id    : chr [1:2] "3eec4d94" "4d071789"
#>   .. ..$ title          : chr [1:2] "What option do you like best? " "Can write a really cool paragraph?"
#>   .. ..$ paragraph      : logi [1:2] NA TRUE
#>   .. ..$ choice_question: chr [1:2] "RADIO" NA
#>   .. ..$ text_question  : logi [1:2] FALSE TRUE
#>   ..$ answers :'data.frame': 4 obs. of  3 variables:
#>   .. ..$ reponse_id       : chr [1:4] "ACYDBNgHfXMXKJ7Z8VQe87e-IrBdrBad0mBWjO1UHYKQys7QX1q_Y69kp1cKcGdI_eueSgA" "ACYDBNgdPc1CkWX1dDycG2cYILE9SLdABPfcRox8WVess33sivSwMvtPxLcLAHWzHsybxnM" "ACYDBNgHfXMXKJ7Z8VQe87e-IrBdrBad0mBWjO1UHYKQys7QX1q_Y69kp1cKcGdI_eueSgA" "ACYDBNgdPc1CkWX1dDycG2cYILE9SLdABPfcRox8WVess33sivSwMvtPxLcLAHWzHsybxnM"
#>   .. ..$ X103e69c2_answers: chr [1:4] "Here's a really cool answer to this question" "Here's a really compelling paragraph" "Here's a really cool answer to this question" "Here's a really compelling paragraph"
#>   .. ..$ X7a10555e_answers: chr [1:4] "Option A" "Option B" "Option A" "Option B"
```

### Slido

[You can read more about Slido data
here](https://community.slido.com/analytics-and-exports-44).

[`get_slido_files()`](../reference/get_slido_files.md) returns this kind
of data.

``` r
get_example_data("slido_data")
class(slido_data)
#> [1] "list"
str(slido_data)
#> List of 4
#>  $ JoinedParticipants: tibble [14 × 5] (S3: tbl_df/tbl/data.frame)
#>   ..$ event_name       : chr [1:14] "Cool-Workshop" "Cool-Workshop" "Cool-Workshop" "Cool-Workshop" ...
#>   ..$ Participant ID   : num [1:14] 1.46e+08 1.46e+08 1.46e+08 1.46e+08 1.46e+08 ...
#>   ..$ Participant Name : chr [1:14] "Anonymous" "Anonymous" "Anonymous" "Anonymous" ...
#>   ..$ Participant Email: chr [1:14] "Anonymous" "Anonymous" "Anonymous" "Anonymous" ...
#>   ..$ Joined at        : chr [1:14] "05/10/2023 18:12:19" "05/10/2023 18:13:02" "05/10/2023 18:15:11" "05/15/2023 14:19:17" ...
#>  $ Leaderboard       : tibble [0 × 1] (S3: tbl_df/tbl/data.frame)
#>   ..$ event_name: chr(0) 
#>  $ Polls-overall     : tibble [29 × 9] (S3: tbl_df/tbl/data.frame)
#>   ..$ event_name    : chr [1:29] "Cool-Workshop" "Cool-Workshop" "Cool-Workshop" "Cool-Workshop" ...
#>   ..$ Poll ID       : num [1:29] 33106652 33106652 33106652 33106682 33106682 ...
#>   ..$ Poll Type     : chr [1:29] "Rating (1-5)" "Rating (1-5)" "Rating (1-5)" "Rating (1-5)" ...
#>   ..$ Poll Question : chr [1:29] "How confident do you feel now to participate in code review practices?" "How confident do you feel now to participate in code review practices?" "How confident do you feel now to participate in code review practices?" "How confident are you now to work on GitHub?" ...
#>   ..$ Poll Option   :List of 29
#>   .. ..$ : num 1
#>   .. ..$ : num 1
#>   .. ..$ : num 1
#>   .. ..$ : chr "5"
#>   .. ..$ : chr "5"
#>   .. ..$ : chr "5"
#>   .. ..$ : num 1
#>   .. ..$ : chr "3"
#>   .. ..$ : num 2
#>   .. ..$ : num 2
#>   .. ..$ : num 1
#>   .. ..$ : chr "3"
#>   .. ..$ : chr "This was great"
#>   .. ..$ : chr "This was okay"
#>   .. ..$ : chr "I like this presentation!"
#>   .. ..$ : chr "This presentation could be better"
#>   .. ..$ : chr "This was the best presentation ever!!!!"
#>   .. ..$ : chr "This presentation was fine"
#>   .. ..$ : chr "Philly Phil"
#>   .. ..$ : chr "Bobby Bob"
#>   .. ..$ : chr "Janey Jane"
#>   .. ..$ : chr "Steve Steve"
#>   .. ..$ : chr "Johnny John"
#>   .. ..$ : chr "Jessie Jessica"
#>   .. ..$ : chr "Franky Frank"
#>   .. ..$ : chr "Debbie Debra"
#>   .. ..$ : chr "Lizzie Liz"
#>   .. ..$ : chr "Freddie Frederick"
#>   .. ..$ : chr "Jilly Jill"
#>   ..$ Correct Answer: logi [1:29] NA NA NA NA NA NA ...
#>   ..$ Count         : num [1:29] 1 2 2 1 2 1 0 2 3 1 ...
#>   ..$ Total Votes   : num [1:29] 5 5 5 4 4 4 0 5 5 5 ...
#>   ..$ Results       : logi [1:29] NA NA NA NA NA NA ...
#>  $ Questions         : tibble [2 × 8] (S3: tbl_df/tbl/data.frame)
#>   ..$ event_name     : chr [1:2] "Cool-Workshop" "Cool-Workshop"
#>   ..$ Question text  : chr [1:2] "Hi" "Hello"
#>   ..$ Highlighted    : num [1:2] 0 0
#>   ..$ Status         : chr [1:2] "Live" "Live"
#>   ..$ User ID        : chr [1:2] "123418162849172381278373333243dhufsgduif1718237" "127489hsfd8w3y9283792yh3ruihgwiuefw"
#>   ..$ Sentiment      : chr [1:2] NA "Neutral"
#>   ..$ Submission Date: chr [1:2] "05/10/2023" "05/15/2023"
#>   ..$ Submission Time: POSIXct[1:2], format: "2024-01-10 16:31:36" "2024-01-10 14:18:10"
```

### Youtube

[You can read more about the Youtube API
here](https://developers.google.com/youtube/v3).

#### Channels

[`get_youtube_channel_stats()`](../reference/get_youtube_channel_stats.md)
returns this kind of data.

``` r
get_example_data("youtube_channel_stats")
class(youtube_channel_stats)
#> [1] "data.frame"
str(youtube_channel_stats)
#> 'data.frame':    1 obs. of  4 variables:
#>  $ viewCount            : chr "12"
#>  $ subscriberCount      : chr "0"
#>  $ hiddenSubscriberCount: logi FALSE
#>  $ videoCount           : chr "2"
```

#### Videos

[`get_youtube_video_stats()`](../reference/get_youtube_video_stats.md)
returns this kind of data.

``` r
get_example_data("youtube_video_stats")
class(youtube_video_stats)
#> [1] "data.frame"
str(youtube_video_stats)
#> 'data.frame':    1 obs. of  5 variables:
#>  $ viewCount    : chr "10"
#>  $ likeCount    : chr "0"
#>  $ dislikeCount : chr "0"
#>  $ favoriteCount: chr "0"
#>  $ commentCount : chr "0"
```

#### Session Info

``` r
sessionInfo()
#> R version 4.5.2 (2025-10-31)
#> Platform: x86_64-pc-linux-gnu
#> Running under: Ubuntu 24.04.3 LTS
#> 
#> Matrix products: default
#> BLAS:   /usr/lib/x86_64-linux-gnu/openblas-pthread/libblas.so.3 
#> LAPACK: /usr/lib/x86_64-linux-gnu/openblas-pthread/libopenblasp-r0.3.26.so;  LAPACK version 3.12.0
#> 
#> locale:
#>  [1] LC_CTYPE=C.UTF-8       LC_NUMERIC=C           LC_TIME=C.UTF-8       
#>  [4] LC_COLLATE=C.UTF-8     LC_MONETARY=C.UTF-8    LC_MESSAGES=C.UTF-8   
#>  [7] LC_PAPER=C.UTF-8       LC_NAME=C              LC_ADDRESS=C          
#> [10] LC_TELEPHONE=C         LC_MEASUREMENT=C.UTF-8 LC_IDENTIFICATION=C   
#> 
#> time zone: UTC
#> tzcode source: system (glibc)
#> 
#> attached base packages:
#> [1] stats     graphics  grDevices utils     datasets  methods   base     
#> 
#> other attached packages:
#> [1] metricminer_1.0.0
#> 
#> loaded via a namespace (and not attached):
#>  [1] jsonlite_2.0.0      dplyr_1.1.4         compiler_4.5.2     
#>  [4] tidyselect_1.2.1    stringr_1.6.0       assertthat_0.2.1   
#>  [7] snakecase_0.11.1    tidyr_1.3.1         jquerylib_0.1.4    
#> [10] systemfonts_1.3.1   textshaping_1.0.4   yaml_2.3.11        
#> [13] fastmap_1.2.0       R6_2.6.1            generics_0.1.4     
#> [16] curl_7.0.0          knitr_1.50          tibble_3.3.0       
#> [19] janitor_2.2.1       desc_1.4.3          lubridate_1.9.4    
#> [22] bslib_0.9.0         pillar_1.11.1       rlang_1.1.6        
#> [25] stringi_1.8.7       cachem_1.1.0        xfun_0.54          
#> [28] fs_1.6.6            sass_0.4.10         timechange_0.3.0   
#> [31] cli_3.6.5           pkgdown_2.2.0       magrittr_2.0.4     
#> [34] digest_0.6.39       gh_1.5.0            googlesheets4_1.1.2
#> [37] lifecycle_1.0.4     vctrs_0.6.5         evaluate_1.0.5     
#> [40] gargle_1.6.0        glue_1.8.0          cellranger_1.1.0   
#> [43] ragg_1.5.0          googledrive_2.1.2   httr_1.4.7         
#> [46] rmarkdown_2.30      purrr_1.2.0         tools_4.5.2        
#> [49] pkgconfig_2.0.3     htmltools_0.5.9
```
