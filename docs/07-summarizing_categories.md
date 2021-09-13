# Summarizing Categories

To demonstrate key ideas in this Chapter, we will again consider our sample of 750 adults ages 21-64 from NHANES 2011-12 which includes some missing values. We'll load into the `nh_750` data frame the information from the `nh_adult750.Rds` file we created in Section \@ref(newNHANES).


```r
nh_750 <- read_rds("data/nh_adult750.Rds")
```


Summarizing categorical variables numerically is mostly about building tables, and calculating percentages or proportions. We'll save our discussion of modeling categorical data for later. Recall that in the `nh_750` data set we built in Section \@ref(newNHANES) we had the following categorical variables. The number of levels indicates the number of possible categories for each categorical variable.

Variable     | Description                  | Levels | Type
----------:  | ---------------------------- | - | ---------
Sex          | sex of subject               | 2 | binary
Race         | subject's race               | 6 | nominal
Education    | subject's educational level  | 5 | ordinal
PhysActive   | Participates in sports?      | 2 | binary
Smoke100     | Smoked 100+ cigarettes?      | 2 | binary
SleepTrouble | Trouble sleeping?            | 2 | binary
HealthGen    | Self-report health           | 5 | ordinal

## The `summary` function for Categorical data

When R recognizes a variable as categorical, it stores it as a *factor*. Such variables get special treatment from the `summary` function, in particular a table of available values (so long as there aren't too many.)


```r
nh_750 %>%
  select(Sex, Race, Education, PhysActive, Smoke100, 
         SleepTrouble, HealthGen, MaritalStatus) %>%
  summary()
```

```
     Sex            Race              Education  
 female:388   Asian   : 70   8th Grade     : 50  
 male  :362   Black   :128   9 - 11th Grade: 76  
              Hispanic: 63   High School   :143  
              Mexican : 80   Some College  :241  
              White   :393   College Grad  :240  
              Other   : 16                       
 PhysActive Smoke100  SleepTrouble     HealthGen  
 No :326    No :453   No :555      Excellent: 84  
 Yes:424    Yes:297   Yes:195      Vgood    :197  
                                   Good     :252  
                                   Fair     :104  
                                   Poor     : 14  
                                   NA's     : 99  
      MaritalStatus
 Divorced    : 78  
 LivePartner : 70  
 Married     :388  
 NeverMarried:179  
 Separated   : 19  
 Widowed     : 16  
```

## Tables to describe One Categorical Variable

Suppose we build a table (using the `tabyl` function from the `janitor` package) to describe the `HealthGen` distribution.


```r
nh_750 %>%
    tabyl(HealthGen) %>%
    adorn_pct_formatting()
```

```
 HealthGen   n percent valid_percent
 Excellent  84   11.2%         12.9%
     Vgood 197   26.3%         30.3%
      Good 252   33.6%         38.7%
      Fair 104   13.9%         16.0%
      Poor  14    1.9%          2.2%
      <NA>  99   13.2%             -
```

Note how the missing (`<NA>`) values are not included in the `valid_percent` calculation, but are in the `percent` calculation. Note also the use of percentage formatting. 

What if we want to add a total count, sometimes called the *marginal* total?


```r
nh_750 %>%
    tabyl(HealthGen) %>%
    adorn_totals() %>%
    adorn_pct_formatting()
```

```
 HealthGen   n percent valid_percent
 Excellent  84   11.2%         12.9%
     Vgood 197   26.3%         30.3%
      Good 252   33.6%         38.7%
      Fair 104   13.9%         16.0%
      Poor  14    1.9%          2.2%
      <NA>  99   13.2%             -
     Total 750  100.0%        100.0%
```

What about marital status, which has no missing data in our sample?


```r
nh_750 %>%
    tabyl(MaritalStatus) %>%
    adorn_totals() %>%
    adorn_pct_formatting()
```

```
 MaritalStatus   n percent
      Divorced  78   10.4%
   LivePartner  70    9.3%
       Married 388   51.7%
  NeverMarried 179   23.9%
     Separated  19    2.5%
       Widowed  16    2.1%
         Total 750  100.0%
```

## Constructing Tables Well

The prolific Howard Wainer is responsible for many interesting books on visualization and related issues, including @HW_GraphicDiscovery and @HW_MedicalIlluminations. These rules come from Chapter 10 of @HW_VisualRevelations.

1. Order the rows and columns in a way that makes sense.
2. Round, a lot!
3. ALL is different and important

### Alabama First!

Which of these Tables is more useful to you?
    
2013 Percent of Students in grades 9-12 who are obese

State | % Obese | 95% CI | Sample Size
:----- | :-------: | :------: | :-----------:
Alabama | 17.1 | (14.6 - 19.9) | 1,499
Alaska | 12.4 | (10.5-14.6)	| 1,167
Arizona |	10.7 |	(8.3-13.6)	| 1,520
Arkansas |	17.8	| (15.7-20.1)	| 1,470
Connecticut |	12.3 |	(10.2-14.7)	| 2,270
Delaware |	14.2 |	(12.9-15.6) |	2,475
Florida |	11.6	| (10.5-12.8)	| 5,491
... | | | 
Wisconsin |	11.6 | 	(9.7-13.9)	| 2,771
Wyoming	| 10.7 |	(9.4-12.2)	| 2,910

or ...

State | % Obese | 95% CI | Sample Size
:----- | :-------: | :------: | :-----------:
Kentucky | 18.0 | (15.7 - 20.6) | 1,537
Arkansas | 17.8 | (15.7 - 20.1) | 1,470
Alabama | 17.1 | (14.6 - 19.9) | 1,499
Tennessee | 16.9 | (15.1 - 18.8) | 1,831
Texas | 15.7 | (13.9 - 17.6) | 3,039
... | | |
Massachusetts | 10.2 | (8.5 - 12.1) | 2,547
Idaho | 9.6 | (8.2 - 11.1) | 1,841
Montana | 9.4 | (8.4 - 10.5) | 4,679
New Jersey | 8.7 | (6.8 - 11.2) | 1,644
Utah | 6.4 | (4.8 - 8.5) | 2,136

It is a rare event when Alabama first is the best choice.

### ALL is different and important

Summaries of rows and columns provide a measure of what is typical or usual. Sometimes a sum is helpful, at other times, consider presenting a median or other summary. The ALL category, as @HW_VisualRevelations suggests, should be both visually different from the individual entries and set spatially apart.

On the whole, it's *far* easier to fall into a good graph in R (at least if you have some ggplot2 skills) than to produce a good table.

## The Mode of a Categorical Variable

A common measure applied to a categorical variable is to identify the mode, the most frequently observed value. To find the mode for variables with lots of categories (so that the `summary` may not be sufficient), we usually tabulate the data, and then sort by the counts of the numbers of observations, as we did with discrete quantitative variables.


```r
nh_750 %>%
    group_by(HealthGen) %>%
    summarise(count = n()) %>%
    arrange(desc(count)) 
```

```
# A tibble: 6 x 2
  HealthGen count
  <fct>     <int>
1 Good        252
2 Vgood       197
3 Fair        104
4 <NA>         99
5 Excellent    84
6 Poor         14
```

## `describe` in the `Hmisc` package


```r
Hmisc::describe(nh_750 %>% 
                    select(Sex, Race, Education, PhysActive, 
                           Smoke100, SleepTrouble, 
                           HealthGen, MaritalStatus))
```

```
nh_750 %>% select(Sex, Race, Education, PhysActive, Smoke100, SleepTrouble, HealthGen, MaritalStatus) 

 8  Variables      750  Observations
------------------------------------------------------------
Sex 
       n  missing distinct 
     750        0        2 
                        
Value      female   male
Frequency     388    362
Proportion  0.517  0.483
------------------------------------------------------------
Race 
       n  missing distinct 
     750        0        6 

lowest : Asian    Black    Hispanic Mexican  White   
highest: Black    Hispanic Mexican  White    Other   
                                                       
Value         Asian    Black Hispanic  Mexican    White
Frequency        70      128       63       80      393
Proportion    0.093    0.171    0.084    0.107    0.524
                   
Value         Other
Frequency        16
Proportion    0.021
------------------------------------------------------------
Education 
       n  missing distinct 
     750        0        5 

lowest : 8th Grade      9 - 11th Grade High School    Some College   College Grad  
highest: 8th Grade      9 - 11th Grade High School    Some College   College Grad  
                                                       
Value           8th Grade 9 - 11th Grade    High School
Frequency              50             76            143
Proportion          0.067          0.101          0.191
                                        
Value        Some College   College Grad
Frequency             241            240
Proportion          0.321          0.320
------------------------------------------------------------
PhysActive 
       n  missing distinct 
     750        0        2 
                      
Value         No   Yes
Frequency    326   424
Proportion 0.435 0.565
------------------------------------------------------------
Smoke100 
       n  missing distinct 
     750        0        2 
                      
Value         No   Yes
Frequency    453   297
Proportion 0.604 0.396
------------------------------------------------------------
SleepTrouble 
       n  missing distinct 
     750        0        2 
                    
Value        No  Yes
Frequency   555  195
Proportion 0.74 0.26
------------------------------------------------------------
HealthGen 
       n  missing distinct 
     651       99        5 

lowest : Excellent Vgood     Good      Fair      Poor     
highest: Excellent Vgood     Good      Fair      Poor     
                                                  
Value      Excellent     Vgood      Good      Fair
Frequency         84       197       252       104
Proportion     0.129     0.303     0.387     0.160
                    
Value           Poor
Frequency         14
Proportion     0.022
------------------------------------------------------------
MaritalStatus 
       n  missing distinct 
     750        0        6 

lowest : Divorced     LivePartner  Married      NeverMarried Separated   
highest: LivePartner  Married      NeverMarried Separated    Widowed     
                                                 
Value          Divorced  LivePartner      Married
Frequency            78           70          388
Proportion        0.104        0.093        0.517
                                                 
Value      NeverMarried    Separated      Widowed
Frequency           179           19           16
Proportion        0.239        0.025        0.021
------------------------------------------------------------
```

## Cross-Tabulations of Two Variables

It is very common for us to want to describe the association of one categorical variable with another. For instance, is there a relationship between Education and SleepTrouble in these data?


```r
nh_750 %>%
    tabyl(Education, SleepTrouble) %>%
    adorn_totals(where = c("row", "col")) 
```

```
      Education  No Yes Total
      8th Grade  40  10    50
 9 - 11th Grade  52  24    76
    High School 102  41   143
   Some College 173  68   241
   College Grad 188  52   240
          Total 555 195   750
```

Note the use of `adorn_totals` to get the marginal counts, and how we specify that we want both the row and column totals. We can add a title for the columns with...


```r
nh_750 %>%
    tabyl(Education, SleepTrouble) %>%
    adorn_totals(where = c("row", "col")) %>%
    adorn_title(placement = "combined")
```

```
 Education/SleepTrouble  No Yes Total
              8th Grade  40  10    50
         9 - 11th Grade  52  24    76
            High School 102  41   143
           Some College 173  68   241
           College Grad 188  52   240
                  Total 555 195   750
```

Often, we'll want to show percentages in a cross-tabulation like this. To get row percentages so that we can directly see the probability of `SleepTrouble = Yes` for each level of `Education`, we can use:


```r
nh_750 %>%
    tabyl(Education, SleepTrouble) %>%
    adorn_totals(where = "row") %>%
    adorn_percentages(denominator = "row") %>%
    adorn_pct_formatting() %>%
    adorn_title(placement = "combined")
```

```
 Education/SleepTrouble    No   Yes
              8th Grade 80.0% 20.0%
         9 - 11th Grade 68.4% 31.6%
            High School 71.3% 28.7%
           Some College 71.8% 28.2%
           College Grad 78.3% 21.7%
                  Total 74.0% 26.0%
```

If we want to compare the distribution of `Education` between the two levels of `SleepTrouble` with column percentages, we can use the following...


```r
nh_750 %>%
    tabyl(Education, SleepTrouble) %>%
    adorn_totals(where = "col") %>%
    adorn_percentages(denominator = "col") %>%
    adorn_pct_formatting() %>%
    adorn_title(placement = "combined") 
```

```
 Education/SleepTrouble    No   Yes Total
              8th Grade  7.2%  5.1%  6.7%
         9 - 11th Grade  9.4% 12.3% 10.1%
            High School 18.4% 21.0% 19.1%
           Some College 31.2% 34.9% 32.1%
           College Grad 33.9% 26.7% 32.0%
```

If we want overall percentages in the cells of the table, so that the total across all combinations of `Education` and `SleepTrouble` is 100%, we can use:


```r
nh_750 %>%
    tabyl(Education, SleepTrouble) %>%
    adorn_totals(where = c("row", "col")) %>%
    adorn_percentages(denominator = "all") %>%
    adorn_pct_formatting() %>%
    adorn_title(placement = "combined") 
```

```
 Education/SleepTrouble    No   Yes  Total
              8th Grade  5.3%  1.3%   6.7%
         9 - 11th Grade  6.9%  3.2%  10.1%
            High School 13.6%  5.5%  19.1%
           Some College 23.1%  9.1%  32.1%
           College Grad 25.1%  6.9%  32.0%
                  Total 74.0% 26.0% 100.0%
```

Another common approach is to include both counts and percentages in a cross-tabulation. Let's look at the breakdown of `HealthGen` by `MaritalStatus`.


```r
nh_750 %>%
    tabyl(MaritalStatus, HealthGen) %>%
    adorn_totals(where = c("row")) %>%
    adorn_percentages(denominator = "row") %>%
    adorn_pct_formatting() %>%
    adorn_ns(position = "front") %>%
    adorn_title(placement = "combined") %>%
    knitr::kable()
```



|MaritalStatus/HealthGen |Excellent  |Vgood       |Good        |Fair        |Poor       |NA_        |
|:-----------------------|:----------|:-----------|:-----------|:-----------|:----------|:----------|
|Divorced                |7  (9.0%)  |19 (24.4%)  |29 (37.2%)  |11 (14.1%)  |3  (3.8%)  |9 (11.5%)  |
|LivePartner             |4  (5.7%)  |19 (27.1%)  |25 (35.7%)  |18 (25.7%)  |0  (0.0%)  |4  (5.7%)  |
|Married                 |46 (11.9%) |101 (26.0%) |130 (33.5%) |41 (10.6%)  |6  (1.5%)  |64 (16.5%) |
|NeverMarried            |25 (14.0%) |52 (29.1%)  |56 (31.3%)  |24 (13.4%)  |3  (1.7%)  |19 (10.6%) |
|Separated               |2 (10.5%)  |3 (15.8%)   |4 (21.1%)   |8 (42.1%)   |0  (0.0%)  |2 (10.5%)  |
|Widowed                 |0  (0.0%)  |3 (18.8%)   |8 (50.0%)   |2 (12.5%)   |2 (12.5%)  |1  (6.2%)  |
|Total                   |84 (11.2%) |197 (26.3%) |252 (33.6%) |104 (13.9%) |14  (1.9%) |99 (13.2%) |

What if we wanted to ignore the missing `HealthGen` values? Most often, I filter down to the complete observations.


```r
nh_750 %>%
    filter(complete.cases(MaritalStatus, HealthGen)) %>%
    tabyl(MaritalStatus, HealthGen) %>%
    adorn_totals(where = c("row")) %>%
    adorn_percentages(denominator = "row") %>%
    adorn_pct_formatting() %>%
    adorn_ns(position = "front") %>%
    adorn_title(placement = "combined")
```

```
 MaritalStatus/HealthGen  Excellent       Vgood        Good
                Divorced  7 (10.1%)  19 (27.5%)  29 (42.0%)
             LivePartner  4  (6.1%)  19 (28.8%)  25 (37.9%)
                 Married 46 (14.2%) 101 (31.2%) 130 (40.1%)
            NeverMarried 25 (15.6%)  52 (32.5%)  56 (35.0%)
               Separated  2 (11.8%)   3 (17.6%)   4 (23.5%)
                 Widowed  0  (0.0%)   3 (20.0%)   8 (53.3%)
                   Total 84 (12.9%) 197 (30.3%) 252 (38.7%)
        Fair       Poor
  11 (15.9%)  3  (4.3%)
  18 (27.3%)  0  (0.0%)
  41 (12.7%)  6  (1.9%)
  24 (15.0%)  3  (1.9%)
   8 (47.1%)  0  (0.0%)
   2 (13.3%)  2 (13.3%)
 104 (16.0%) 14  (2.2%)
```

For more on working with `tabyls`, see the vignette in the `janitor` package. There you'll find a complete list of all of the `adorn` functions, for example.

Here's another approach, to look at the cross-classification of Race and HealthGen:


```r
xtabs(~ Race + HealthGen, data = nh_750)
```

```
          HealthGen
Race       Excellent Vgood Good Fair Poor
  Asian           10    17   24    6    1
  Black           15    28   40   24    4
  Hispanic         4     9   24   13    2
  Mexican          6    12   25   21    2
  White           48   128  131   37    5
  Other            1     3    8    3    0
```

## Cross-Classifying Three Categorical Variables

Suppose we are interested in `Smoke100` and its relationship to `PhysActive` and `SleepTrouble`.


```r
nh_750 %>%
    tabyl(Smoke100, PhysActive, SleepTrouble) %>%
    adorn_title(placement = "top")
```

```
$No
          PhysActive    
 Smoke100         No Yes
       No        137 219
      Yes         93 106

$Yes
          PhysActive    
 Smoke100         No Yes
       No         41  56
      Yes         55  43
```

The result here is a tabyl of `Smoke100` (rows) by `PhysActive` (columns), split into a list by `SleepTrouble`. 

There are several alternative approaches for doing this, although I expect us to stick with `tabyl` for our work in 431. These alternatives include the use of the `xtabs` function:


```r
xtabs(~ Smoke100 + PhysActive + SleepTrouble, data = nh_750)
```

```
, , SleepTrouble = No

        PhysActive
Smoke100  No Yes
     No  137 219
     Yes  93 106

, , SleepTrouble = Yes

        PhysActive
Smoke100  No Yes
     No   41  56
     Yes  55  43
```

We can also build a **flat** version of this table, as follows:


```r
ftable(Smoke100 ~ PhysActive + SleepTrouble, data = nh_750)
```

```
                        Smoke100  No Yes
PhysActive SleepTrouble                 
No         No                    137  93
           Yes                    41  55
Yes        No                    219 106
           Yes                    56  43
```


And we can do this with `dplyr` functions and the `table()` function, as well, for example...


```r
nh_750 %>%
    select(Smoke100, PhysActive, SleepTrouble) %>%
    table() 
```

```
, , SleepTrouble = No

        PhysActive
Smoke100  No Yes
     No  137 219
     Yes  93 106

, , SleepTrouble = Yes

        PhysActive
Smoke100  No Yes
     No   41  56
     Yes  55  43
```

## Gaining Control over Tables in R: the `gt` package

With the `gt` package, anyone can make wonderful-looking tables using the R programming language. The `gt` package allows you to start with a tibble or data frame, and use it to make very detailed tables that look professional, and includes tools that enable you to include titles and subtitles, all sorts of labels, as well as footnotes and source notes. 

Here's a fairly simple example of a cross-tabulation of part of the `nh_750` data built using a few tools from the `gt` package.


```r
library(gt)

temp_tbl <- nh_750 %>% filter(complete.cases(PhysActive, HealthGen)) %>%
  tabyl(PhysActive, HealthGen) %>%
  tibble() 

gt(temp_tbl) %>%
  tab_header(title = md("**Cross-Tabulation from nh_750**"),
             subtitle = md("Physical Activity vs. Overall Health"))
```

```{=html}
<div id="hfgmanzlvr" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#hfgmanzlvr .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#hfgmanzlvr .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#hfgmanzlvr .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#hfgmanzlvr .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 6px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#hfgmanzlvr .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#hfgmanzlvr .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#hfgmanzlvr .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#hfgmanzlvr .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#hfgmanzlvr .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#hfgmanzlvr .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#hfgmanzlvr .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 5px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#hfgmanzlvr .gt_group_heading {
  padding: 8px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#hfgmanzlvr .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#hfgmanzlvr .gt_from_md > :first-child {
  margin-top: 0;
}

#hfgmanzlvr .gt_from_md > :last-child {
  margin-bottom: 0;
}

#hfgmanzlvr .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#hfgmanzlvr .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#hfgmanzlvr .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#hfgmanzlvr .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#hfgmanzlvr .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#hfgmanzlvr .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#hfgmanzlvr .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#hfgmanzlvr .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#hfgmanzlvr .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#hfgmanzlvr .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#hfgmanzlvr .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#hfgmanzlvr .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#hfgmanzlvr .gt_left {
  text-align: left;
}

#hfgmanzlvr .gt_center {
  text-align: center;
}

#hfgmanzlvr .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#hfgmanzlvr .gt_font_normal {
  font-weight: normal;
}

#hfgmanzlvr .gt_font_bold {
  font-weight: bold;
}

#hfgmanzlvr .gt_font_italic {
  font-style: italic;
}

#hfgmanzlvr .gt_super {
  font-size: 65%;
}

#hfgmanzlvr .gt_footnote_marks {
  font-style: italic;
  font-weight: normal;
  font-size: 65%;
}
</style>
<table class="gt_table">
  <thead class="gt_header">
    <tr>
      <th colspan="6" class="gt_heading gt_title gt_font_normal" style><strong>Cross-Tabulation from nh_750</strong></th>
    </tr>
    <tr>
      <th colspan="6" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style>Physical Activity vs. Overall Health</th>
    </tr>
  </thead>
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">PhysActive</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">Excellent</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">Vgood</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">Good</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">Fair</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">Poor</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr><td class="gt_row gt_center">No</td>
<td class="gt_row gt_right">24</td>
<td class="gt_row gt_right">66</td>
<td class="gt_row gt_right">126</td>
<td class="gt_row gt_right">59</td>
<td class="gt_row gt_right">10</td></tr>
    <tr><td class="gt_row gt_center">Yes</td>
<td class="gt_row gt_right">60</td>
<td class="gt_row gt_right">131</td>
<td class="gt_row gt_right">126</td>
<td class="gt_row gt_right">45</td>
<td class="gt_row gt_right">4</td></tr>
  </tbody>
  
  
</table>
</div>
```

The `gt` package and its usage is described in detail at https://gt.rstudio.com/.


