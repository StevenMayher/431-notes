# (PART\*) Appendix {-}

# Some R Tips {-}

## Using data from an R package {-}

To use data from an R package, for instance, the `bechdel` data from the `fivethirtyeight` package, you can simply load the relevant package with `library` and then the data frame will be available


```r
library(fivethirtyeight)
```

```
Some larger datasets need to be installed separately,
like senators and house_district_forecast. To install
these, we recommend you install the
fivethirtyeightdata package by running:
install.packages('fivethirtyeightdata', repos =
'https://fivethirtyeightdata.github.io/drat/', type =
'source')
```

```r
bechdel
```

```
# A tibble: 1,794 x 15
    year imdb  title test  clean_test binary budget domgross
   <int> <chr> <chr> <chr> <ord>      <chr>   <int>    <dbl>
 1  2013 tt17~ 21 &~ nota~ notalk     FAIL   1.3 e7 25682380
 2  2012 tt13~ Dred~ ok-d~ ok         PASS   4.5 e7 13414714
 3  2013 tt20~ 12 Y~ nota~ notalk     FAIL   2   e7 53107035
 4  2013 tt12~ 2 Gu~ nota~ notalk     FAIL   6.1 e7 75612460
 5  2013 tt04~ 42    men   men        FAIL   4   e7 95020213
 6  2013 tt13~ 47 R~ men   men        FAIL   2.25e8 38362475
 7  2013 tt16~ A Go~ nota~ notalk     FAIL   9.2 e7 67349198
 8  2013 tt21~ Abou~ ok-d~ ok         PASS   1.2 e7 15323921
 9  2013 tt18~ Admi~ ok    ok         PASS   1.3 e7 18007317
10  2013 tt18~ Afte~ nota~ notalk     FAIL   1.3 e8 60522097
# ... with 1,784 more rows, and 7 more variables:
#   intgross <dbl>, code <chr>, budget_2013 <int>,
#   domgross_2013 <dbl>, intgross_2013 <dbl>,
#   period_code <int>, decade_code <int>
```

## Using `read_rds` to read in an R data set {-}

We have provided the `nnyfs.Rds` data file on the course data page.

Suppose you have downloaded this data file into a directory on your computer called `data` which is a sub-directory of the directory where you plan to do your work, perhaps called `431-nnyfs`.

Open RStudio and create a new project into the `431-nnyfs` directory on your computer. You should see a `data` subdirectory in the Files window in RStudio after the project is created.

Now, read in the `nnyfs.Rds` file to a new tibble in R called `nnyfs_new` with the following command:


```r
nnyfs_new <- read_rds("data/nnyfs.Rds")
```
 
Here are the results...


```r
nnyfs_new
```

```
# A tibble: 1,518 x 45
    SEQN sex    age_child race_eth       educ_child language
   <dbl> <fct>      <dbl> <fct>               <dbl> <fct>   
 1 71917 Female        15 3_Black Non-H~          9 English 
 2 71918 Female         8 3_Black Non-H~          2 English 
 3 71919 Female        14 2_White Non-H~          8 English 
 4 71920 Female        15 2_White Non-H~          8 English 
 5 71921 Male           3 2_White Non-H~         NA English 
 6 71922 Male          12 1_Hispanic              6 English 
 7 71923 Male          12 2_White Non-H~          5 English 
 8 71924 Female         8 4_Other Race/~          2 English 
 9 71925 Male           7 1_Hispanic              0 English 
10 71926 Male           8 3_Black Non-H~          2 English 
# ... with 1,508 more rows, and 39 more variables:
#   sampling_wt <dbl>, income_pov <dbl>, age_adult <dbl>,
#   educ_adult <fct>, respondent <fct>, salt_used <fct>,
#   energy <dbl>, protein <dbl>, sugar <dbl>, fat <dbl>,
#   diet_yesterday <fct>, water <dbl>, plank_time <dbl>,
#   height <dbl>, weight <dbl>, bmi <dbl>, bmi_cat <fct>,
#   arm_length <dbl>, waist <dbl>, arm_circ <dbl>, ...
```

## Using `read_csv` to read in a comma-separated version of a data file {-}

We have provided the `nnyfs.csv` data file on the course data page.

Suppose you have downloaded this data file into a directory on your computer called `data` which is a sub-directory of the directory where you plan to do your work, perhaps called `431-nnyfs`.

Open RStudio and create a new project into the `431-nnyfs` directory on your computer. You should see a `data` subdirectory in the Files window in RStudio after the project is created.

Now, read in the `nnyfs.csv` file to a new tibble in R called `nnyfs_new2` with the following command:


```r
nnyfs_new2 <- read_csv("data/nnyfs.csv")
```

```
Rows: 1518 Columns: 45
```

```
-- Column specification ------------------------------------
Delimiter: ","
chr (18): sex, race_eth, language, educ_adult, responden...
dbl (27): SEQN, age_child, educ_child, sampling_wt, inco...
```

```

i Use `spec()` to retrieve the full column specification for this data.
i Specify the column types or set `show_col_types = FALSE` to quiet this message.
```

```r
nnyfs_new2
```

```
# A tibble: 1,518 x 45
    SEQN sex    age_child race_eth       educ_child language
   <dbl> <chr>      <dbl> <chr>               <dbl> <chr>   
 1 71917 Female        15 3_Black Non-H~          9 English 
 2 71918 Female         8 3_Black Non-H~          2 English 
 3 71919 Female        14 2_White Non-H~          8 English 
 4 71920 Female        15 2_White Non-H~          8 English 
 5 71921 Male           3 2_White Non-H~         NA English 
 6 71922 Male          12 1_Hispanic              6 English 
 7 71923 Male          12 2_White Non-H~          5 English 
 8 71924 Female         8 4_Other Race/~          2 English 
 9 71925 Male           7 1_Hispanic              0 English 
10 71926 Male           8 3_Black Non-H~          2 English 
# ... with 1,508 more rows, and 39 more variables:
#   sampling_wt <dbl>, income_pov <dbl>, age_adult <dbl>,
#   educ_adult <chr>, respondent <chr>, salt_used <chr>,
#   energy <dbl>, protein <dbl>, sugar <dbl>, fat <dbl>,
#   diet_yesterday <chr>, water <dbl>, plank_time <dbl>,
#   height <dbl>, weight <dbl>, bmi <dbl>, bmi_cat <chr>,
#   arm_length <dbl>, waist <dbl>, arm_circ <dbl>, ...
```
 
If you also want to convert the `character` variables to `factors`, as you will often want to do before analyzing the results, you should instead use:


```r
nnyfs_new3 <- read_csv("data/nnyfs.csv") %>%
    mutate(across(where(is.character), as_factor))
```

```
Rows: 1518 Columns: 45
```

```
-- Column specification ------------------------------------
Delimiter: ","
chr (18): sex, race_eth, language, educ_adult, responden...
dbl (27): SEQN, age_child, educ_child, sampling_wt, inco...
```

```

i Use `spec()` to retrieve the full column specification for this data.
i Specify the column types or set `show_col_types = FALSE` to quiet this message.
```

```r
nnyfs_new3
```

```
# A tibble: 1,518 x 45
    SEQN sex    age_child race_eth       educ_child language
   <dbl> <fct>      <dbl> <fct>               <dbl> <fct>   
 1 71917 Female        15 3_Black Non-H~          9 English 
 2 71918 Female         8 3_Black Non-H~          2 English 
 3 71919 Female        14 2_White Non-H~          8 English 
 4 71920 Female        15 2_White Non-H~          8 English 
 5 71921 Male           3 2_White Non-H~         NA English 
 6 71922 Male          12 1_Hispanic              6 English 
 7 71923 Male          12 2_White Non-H~          5 English 
 8 71924 Female         8 4_Other Race/~          2 English 
 9 71925 Male           7 1_Hispanic              0 English 
10 71926 Male           8 3_Black Non-H~          2 English 
# ... with 1,508 more rows, and 39 more variables:
#   sampling_wt <dbl>, income_pov <dbl>, age_adult <dbl>,
#   educ_adult <fct>, respondent <fct>, salt_used <fct>,
#   energy <dbl>, protein <dbl>, sugar <dbl>, fat <dbl>,
#   diet_yesterday <fct>, water <dbl>, plank_time <dbl>,
#   height <dbl>, weight <dbl>, bmi <dbl>, bmi_cat <fct>,
#   arm_length <dbl>, waist <dbl>, arm_circ <dbl>, ...
```
Note that, for example, `sex` and `race_eth` are now listed as factor (`fctr`) variables. One place where this distinction between `character` and `factor` variables matters is when you summarize the data.


```r
summary(nnyfs_new2$race_eth)
```

```
   Length     Class      Mode 
     1518 character character 
```


```r
summary(nnyfs_new3$race_eth)
```

```
  3_Black Non-Hispanic   2_White Non-Hispanic 
                   338                    610 
            1_Hispanic 4_Other Race/Ethnicity 
                   450                    120 
```

## Converting Character Variables into Factors {-}

The command you want to create `newdata` from `olddata` is:

```
newdata <- olddata %>%
    mutate(across(where(is.character), as_factor))
```

For more on factors, visit https://r4ds.had.co.nz/factors.html

## Converting Data Frames to Tibbles {-}

Use `as_tibble()` or simply `tibble()` to assign the attributes of a tibble to a data frame. Note that `read_rds` and `read_csv` automatically create tibbles.

For more on tibbles, visit https://r4ds.had.co.nz/tibbles.html.

## For more advice {-}

Consider visiting the software tutorials page under the R and Data heading on our main web site.
