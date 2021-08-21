# Data Structures and Types of Variables 

## Data require structure and context

**Descriptive statistics** are concerned with the presentation, organization and summary of data, as suggested in @Norman-Streiner. This includes various methods of organizing and graphing data to get an idea of what those data can tell us. 

As @Vittinghoff suggest, the nature of the measurement determines how best to describe it statistically, and the main distinction is between **numerical** and **categorical** variables. Even this is a little tricky - plenty of data can have values that look like numerical values, but are just numerals serving as labels. 

As @BockVD point out, the truly critical notion, of course, is that data values, no matter what kind, are useless without their contexts. The Five W's (Who, What [and in what units], When, Where, Why, and often How) are just as useful for establishing the context of data as they are in journalism. If you can't answer Who and What, in particular, you don't have any useful information.

In general, each row of a data frame corresponds to an individual (respondent, experimental unit, record, or observation) about whom some characteristics are gathered in columns (and these characteristics may be called variables, factors or data elements.) Every column / variable should have a name that indicates *what* it is measuring, and every row / observation should have a name that indicates *who* is being measured.

## A New NHANES Adult Sample {#newNHANES} 

In Chapter \@ref(dataviz), we spent some time with a sample from the National Health and Nutrition Examination. Now, by changing the value of the `set.seed` function which determines the starting place for the random sampling, and changing some other specifications, we'll generate a new sample describing 500 adult subjects who completed the 2011-12 version of the survey when they were between the ages of 21 and 64.

Note also that what is listed in the NHANES data frame as `Gender` should be more correctly referred to as `sex`. `Sex` is a biological feature of an individual, while `Gender` is a social construct. This is an important distinction, so I'll change the name of the variable. I'm also changing the names of three other variables, to create `Race`, `SBP` and `DBP`.


```r
# library(NHANES) # NHANES package/library of functions, data

nh_temp <- NHANES %>%
    filter(SurveyYr == "2011_12") %>%
    filter(Age >= 21 & Age < 65) %>%
    mutate(Sex = Gender, Race = Race3, SBP = BPSysAve, DBP = BPDiaAve) %>%
    select(ID, Sex, Age, Race, Education, BMI, SBP, DBP, 
           Pulse, PhysActive, Smoke100, SleepTrouble, 
           MaritalStatus, HealthGen)

set.seed(431002) 
# use set.seed to ensure that we all get the same random sample 

nh_adults <- sample_n(nh_temp, size = 500) 

nh_adults
```

```
# A tibble: 500 x 14
      ID Sex     Age Race  Education   BMI   SBP   DBP Pulse
   <int> <fct> <int> <fct> <fct>     <dbl> <int> <int> <int>
 1 71531 male     35 White Some Col~  22.4   143    90    84
 2 68613 fema~    61 White Some Col~  27.7   119    86   112
 3 67064 male     31 White College ~  26.6   110    76    86
 4 63924 fema~    29 Black High Sch~  41.9    98    56    74
 5 62840 male     60 White 8th Grade  35.8   127     0   110
 6 68058 male     50 White Some Col~  30.6    NA    NA    NA
 7 68936 fema~    36 Black High Sch~  30.5   119    69    60
 8 71189 male     51 White College ~  25.6   112    70    54
 9 69936 fema~    54 Asian College ~  21.8   126    80    78
10 70687 male     59 White College ~  25.5   149    89    62
# ... with 490 more rows, and 5 more variables:
#   PhysActive <fct>, Smoke100 <fct>, SleepTrouble <fct>,
#   MaritalStatus <fct>, HealthGen <fct>
```

The data consist of 500 rows (observations) on 13 variables (columns). Essentially, we have 13 pieces of information on each of 500 adult NHANES subjects who were included in the 2011-12 panel.

### Summarizing the Data's Structure

We can identify the number of rows and columns in a data frame or tibble with the `dim` function.


```r
dim(nh_adults)
```

```
[1] 500  14
```


The `str` function provides a lot of information about the structure of a data frame or tibble.


```r
str(nh_adults)
```

```
tibble [500 x 14] (S3: tbl_df/tbl/data.frame)
 $ ID           : int [1:500] 71531 68613 67064 63924 62840 68058 68936 71189 69936 70687 ...
 $ Sex          : Factor w/ 2 levels "female","male": 2 1 2 1 2 2 1 2 1 2 ...
 $ Age          : int [1:500] 35 61 31 29 60 50 36 51 54 59 ...
 $ Race         : Factor w/ 6 levels "Asian","Black",..: 5 5 5 2 5 5 2 5 1 5 ...
 $ Education    : Factor w/ 5 levels "8th Grade","9 - 11th Grade",..: 4 4 5 3 1 4 3 5 5 5 ...
 $ BMI          : num [1:500] 22.4 27.7 26.6 41.9 35.8 30.6 30.5 25.6 21.8 25.5 ...
 $ SBP          : int [1:500] 143 119 110 98 127 NA 119 112 126 149 ...
 $ DBP          : int [1:500] 90 86 76 56 0 NA 69 70 80 89 ...
 $ Pulse        : int [1:500] 84 112 86 74 110 NA 60 54 78 62 ...
 $ PhysActive   : Factor w/ 2 levels "No","Yes": 2 1 2 1 1 1 1 2 2 2 ...
 $ Smoke100     : Factor w/ 2 levels "No","Yes": 1 1 2 2 2 2 1 2 1 1 ...
 $ SleepTrouble : Factor w/ 2 levels "No","Yes": 2 1 1 2 2 2 1 1 1 1 ...
 $ MaritalStatus: Factor w/ 6 levels "Divorced","LivePartner",..: 4 6 3 5 3 3 4 3 3 6 ...
 $ HealthGen    : Factor w/ 5 levels "Excellent","Vgood",..: 3 2 3 4 5 3 3 NA 3 1 ...
```

To see the first few observations, use `head`, and to see the last few, try `tail`...


```r
tail(nh_adults, 5) # shows the last five observations in the data set
```

```
# A tibble: 5 x 14
     ID Sex      Age Race  Education   BMI   SBP   DBP Pulse
  <int> <fct>  <int> <fct> <fct>     <dbl> <int> <int> <int>
1 66770 female    22 White Some Col~  44.6   100    90    92
2 68754 male      57 White Some Col~  23.2   124    85    82
3 70911 male      59 White College ~  24.5   118    57    76
4 71393 male      27 White High Sch~  25.7   116    61    88
5 70458 female    35 Black 9 - 11th~  21.9   115    64    84
# ... with 5 more variables: PhysActive <fct>,
#   Smoke100 <fct>, SleepTrouble <fct>,
#   MaritalStatus <fct>, HealthGen <fct>
```

### What are the variables?

We can use the `glimpse` function to get a short preview of the data.


```r
glimpse(nh_adults)
```

```
Rows: 500
Columns: 14
$ ID            <int> 71531, 68613, 67064, 63924, 62840, 6~
$ Sex           <fct> male, female, male, female, male, ma~
$ Age           <int> 35, 61, 31, 29, 60, 50, 36, 51, 54, ~
$ Race          <fct> White, White, White, Black, White, W~
$ Education     <fct> Some College, Some College, College ~
$ BMI           <dbl> 22.4, 27.7, 26.6, 41.9, 35.8, 30.6, ~
$ SBP           <int> 143, 119, 110, 98, 127, NA, 119, 112~
$ DBP           <int> 90, 86, 76, 56, 0, NA, 69, 70, 80, 8~
$ Pulse         <int> 84, 112, 86, 74, 110, NA, 60, 54, 78~
$ PhysActive    <fct> Yes, No, Yes, No, No, No, No, Yes, Y~
$ Smoke100      <fct> No, No, Yes, Yes, Yes, Yes, No, Yes,~
$ SleepTrouble  <fct> Yes, No, No, Yes, Yes, Yes, No, No, ~
$ MaritalStatus <fct> NeverMarried, Widowed, Married, Sepa~
$ HealthGen     <fct> Good, Vgood, Good, Fair, Poor, Good,~
```

The variables we have collected are described in the brief table below^[Descriptions are adapted from the ?NHANES help file. Remember that what NHANES lists as Gender is captured here as Sex, and similarly Race3, BPSysAve and BPDiaAve from NHANES are here listed as Race, SBP and DBP.].

Variable | Description | Sample Values
----------:  | ------------------------------------------ | -------------
ID           | a numerical code identifying the subject   | 64427, 63788
Sex          | sex of subject (2 levels)                  | male, female
Age          | age (years) at screening of subject        | 37, 40
Race         | reported race of subject (6 levels)        | White, Asian
Education    | educational level of subject (5 levels)    | College Grad, High School
BMI          | body-mass index, in kg/m^2^                | 36.5, 18.2
SBP          | systolic blood pressure in mm Hg           | 111, 115
DBP          | diastolic blood pressure in mm Hg          | 72, 74
Pulse        | 60 second pulse rate in beats per minute   | 56, 102
PhysActive   | Moderate or vigorous-intensity sports?     | Yes, No
Smoke100     | Smoked at least 100 cigarettes lifetime?   | Yes, No
SleepTrouble | Told a doctor they have trouble sleeping?  | Yes, No
MaritalStatus | Marital Status    | Married, Divorced
HealthGen    | Self-report general health rating (5 lev.) | Vgood, Good

The levels for the multi-categorical variables are:

- **Race**: Mexican, Hispanic, White, Black, Asian, or Other.
- **Education**: 8th Grade, 9 - 11th Grade, High School, Some College, or College Grad.
- **MaritalStatus**: Married, Widowed, Divorced, Separated, NeverMarried or LivePartner (living with partner).
- **HealthGen**: Excellent, Vgood, Good, Fair or Poor.

Some details can be obtained using the `summary` function.


```r
summary(nh_adults)
```

```
       ID            Sex           Age       
 Min.   :62199   female:221   Min.   :21.00  
 1st Qu.:64522   male  :279   1st Qu.:31.00  
 Median :67192                Median :42.00  
 Mean   :67122                Mean   :41.91  
 3rd Qu.:69654                3rd Qu.:53.00  
 Max.   :71911                Max.   :64.00  
                                             
       Race              Education        BMI       
 Asian   : 42   8th Grade     : 24   Min.   :17.30  
 Black   : 63   9 - 11th Grade: 60   1st Qu.:23.80  
 Hispanic: 26   High School   : 81   Median :27.50  
 Mexican : 38   Some College  :153   Mean   :28.48  
 White   :313   College Grad  :182   3rd Qu.:31.60  
 Other   : 18                        Max.   :63.30  
                                     NA's   :5      
      SBP             DBP             Pulse       
 Min.   : 84.0   Min.   :  0.00   Min.   : 40.00  
 1st Qu.:110.0   1st Qu.: 66.00   1st Qu.: 64.00  
 Median :118.0   Median : 72.00   Median : 72.00  
 Mean   :119.2   Mean   : 72.13   Mean   : 73.41  
 3rd Qu.:127.0   3rd Qu.: 78.00   3rd Qu.: 82.00  
 Max.   :209.0   Max.   :103.00   Max.   :112.00  
 NA's   :15      NA's   :15       NA's   :15      
 PhysActive Smoke100  SleepTrouble      MaritalStatus
 No :215    No :297   No :380      Divorced    : 51  
 Yes:285    Yes:203   Yes:120      LivePartner : 51  
                                   Married     :259  
                                   NeverMarried:112  
                                   Separated   : 16  
                                   Widowed     : 11  
                                                     
     HealthGen  
 Excellent: 50  
 Vgood    :154  
 Good     :184  
 Fair     : 49  
 Poor     : 14  
 NA's     : 49  
                
```

Note the appearance of `NA's` (indicating missing values) in some columns, and that some variables are summarized by a list of their (categorical) values and some (quantitative/numeric) variables are summarized with a minimum, quartiles and mean.

## Quantitative Variables

Variables recorded in numbers that we use as numbers are called **quantitative**. Familiar examples include incomes, heights, weights, ages, distances, times, and counts. All quantitative variables have measurement units, which tell you how the quantitative variable was measured. Without units (like miles per hour, angstroms, yen or degrees Celsius) the values of a quantitative variable have no meaning. 

- It does little good to be promised a salary of 80,000 a year if you don't know whether it will be paid in Euros, dollars, yen or Estonian kroon. 

- You might be surprised to see someone whose age is 72 listed in a database on childhood diseases until you find out that age is measured in months.

- Often just seeking the units can reveal a variable whose definition is challenging - just how do we measure "friendliness", or "success," for example.

- Quantitative variables may also be classified by whether they are **continuous** or can only take on a **discrete** set of values. Continuous data may take on any value, within a defined range. Suppose we are measuring height. While height is really continuous, our measuring stick usually only lets us measure with a certain degree of precision. If our measurements are only trustworthy to the nearest centimeter with the ruler we have, we might describe them as discrete measures. But we could always get a more precise ruler. The measurement divisions we make in moving from a continuous concept to a discrete measurement are usually fairly arbitrary. Another way to think of this, if you enjoy music, is that, as suggested in @Norman-Streiner, a piano is a *discrete* instrument, but a violin is a *continuous* one, enabling finer distinctions between notes than the piano is capable of making. Sometimes the distinction between continuous and discrete is important, but usually, it's not.

    + The `nh_adults` data includes several quantitative variables, specifically `Age`, `BMI`, `SBP`, `DBP` and `Pulse`.
    + We know these are quantitative because they have units: `Age` in years, `BMI` in kg/m^2^, the `BP` measurements in mm Hg, and `Pulse` in beats per minute.
    + Depending on the context, we would likely treat most of these as *discrete* given that are measurements are fairly crude (this is certainly true for `Age`, measured in years) although BMI is probably *continuous* in most settings, even though it is a function of two other measures (`Height` and `Weight`) which are rounded off to integer numbers of centimeters and kilograms, respectively.

- It is also possible to separate out quantitative variables into **ratio** variables or **interval** variables. An interval variable has equal distances between values, but the zero point is arbitrary. A ratio variable has equal intervals between values, and a meaningful zero point. For example, weight is an example of a ratio variable, while IQ is an example of an interval variable. We all know what zero weight is. An intelligence score like IQ is a different matter. We say that the average IQ is 100, but that's only by convention. We could just as easily have decided to add 400 to every IQ value and make the average 500 instead. Because IQ's intervals are equal, the difference between and IQ of 70 and an IQ of 80 is the same as the difference between 120 and 130. However, an IQ of 100 is not twice as high as an IQ of 50. The point is that if the zero point is artificial and moveable, then the differences between numbers are meaningful but the ratios between them are not. On the other hand, most lab test values are ratio variables, as are physical characteristics like height and weight. A person who weighs 100 kg is twice as heavy as one who weighs 50 kg; even when we convert kg to pounds, this is still true. For the most part, we can treat and analyze interval or ratio variables the same way.

    + Each of the quantitative variables in our `nh_adults` data can be thought of as ratio variables.

- Quantitative variables lend themselves to many of the summaries we will discuss, like means, quantiles, and our various measures of spread, like the standard deviation or inter-quartile range. They also have at least a chance to follow the Normal distribution.

### A look at BMI (Body-Mass Index)

The definition of BMI (*body-mass index*) for adult subjects (which is expressed in units of kg/m^2^) is:

$$
\mbox{Body Mass Index} = \frac{\mbox{weight in kg}}{(\mbox{height in meters})^2} = 703 \times \frac{\mbox{weight in pounds}}{(\mbox{height in inches})^2}
$$

> [BMI is essentially] ... a measure of a person's *thinness* or *thickness*... BMI was designed for use as a simple means of classifying average sedentary (physically inactive) populations, with an average body composition. For these individuals, the current value recommendations are as follow: a BMI from 18.5 up to 25 may indicate optimal weight, a BMI lower than 18.5 suggests the person is underweight, a number from 25 up to 30 may indicate the person is overweight, and a number from 30 upwards suggests the person is obese.
> 
> Wikipedia, https://en.wikipedia.org/wiki/Body_mass_index

## Qualitative (Categorical) Variables

**Qualitative** or categorical variables consist of names of categories. These names may be numerical, but the numbers (or names) are simply codes to identify the groups or categories into which the individuals are divided. Categorical variables with two categories, like yes or no, up or down, or, more generally, 1 and 0, are called **binary** variables. Those with more than two-categories are sometimes called **multi-categorical** variables. 

- When the categories included in a variable are merely names, and come in no particular order, we sometimes call them **nominal** variables. The most important summary of such a variable is usually a table of frequencies, and the mode becomes an important single summary, while the mean and median are essentially useless.

    + In the nh_adults data, `Race` is a nominal variable with multiple unordered categories. So is `MaritalStatus`.

- The alternative categorical variable (where order matters) is called **ordinal**, and includes variables that are sometimes thought of as falling right in between quantitative and qualitative variables. 

    + Examples of ordinal multi-categorical variables in the `nh_adults` data include the Education and HealthGen variables.
    + Answers to questions like "How is your overall physical health?" with available responses Excellent, Very Good, Good, Fair or Poor, which are often coded as 1-5, certainly provide a perceived *order*, but a group of people with average health status 4 (Very Good) is not necessarily twice as healthy as a group with average health status of 2 (Fair). 

- Sometimes we treat the values from ordinal variables as sufficiently scaled to permit us to use quantitative approaches like means, quantiles, and standard deviations to summarize and model the results, and at other times, we'll treat ordinal variables as if they were nominal, with tables and percentages our primary tools.

- Note that all binary variables may be treated as ordinal, or nominal.

    + Binary variables in the `nh_adults` data include `Sex`, `PhysActive`, `Smoke100`, `SleepTrouble`. Each can be thought of as either ordinal or nominal.

Lots of variables may be treated as either quantitative or qualitative, depending on how we use them. For instance, we usually think of age as a quantitative variable, but if we simply use age to make the distinction between "child" and "adult" then we are using it to describe categorical information. Just because your variable's values are numbers, don't assume that the information provided is quantitative.

