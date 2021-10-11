# Larger Contingency Tables

What will we do with tables describing data from more than two categories at a time, returning to the notion of independent (rather than paired or matched) samples? The chi-square tests we have already seen in our `twobytwo` table output will extend nicely to this scenario, especially the Pearson $\chi^2$ (asymptotic) test.

## A 2x3 Table: Comparing Response to Active vs. Placebo

The table below, containing 2 rows and 3 columns of data (ignoring the marginal totals) specifies the number of patients who show *complete*, *partial*, or *no response* after treatment with either **active** medication or a **placebo**.

Group | None | Partial | Complete
-----:| :---:| :----: | :-----:
Active | 16 | 26 | 29
Placebo | 24 | 26 | 18

Is there a statistically significant association here? That is to say, is there a statistically significant difference between the treatment groups in the distribution of responses?

### Getting the Table into R

To answer this, we'll have to get the data from this contingency table into a matrix in R. Here's one approach...


```r
T1 <- matrix(c(16,26,29,24,26,18), ncol=3, nrow=2, byrow=TRUE)
rownames(T1) <- c("Active", "Placebo")
colnames(T1) <- c("None", "Partial", "Complete")

T1
```

```
        None Partial Complete
Active    16      26       29
Placebo   24      26       18
```

### Manipulating the Table's presentation

We can add margins to the matrix to get a table including row and column totals.


```r
addmargins(T1)
```

```
        None Partial Complete Sum
Active    16      26       29  71
Placebo   24      26       18  68
Sum       40      52       47 139
```

Instead of the counts, we can tabulate the proportion of all patients within each cell.


```r
prop.table(T1)
```

```
             None   Partial  Complete
Active  0.1151079 0.1870504 0.2086331
Placebo 0.1726619 0.1870504 0.1294964
```

Now, to actually obtain a *p* value and perform the significance test with $H_0$: rows and columns are independent vs. $H_A$: rows and columns are associated, we simply run a Pearson chi-square test on T1 ...


```r
chisq.test(T1)
```

```

	Pearson's Chi-squared test

data:  T1
X-squared = 4.1116, df = 2, p-value = 0.128
```

Thanks to a p-value of about 0.13 (using the Pearson chi-square test) our conclusion would be to retain the null hypothesis of independence in this setting.

We could have run a Fisher's exact test, too, if we needed it. 


```r
fisher.test(T1)
```

```

	Fisher's Exact Test for Count Data

data:  T1
p-value = 0.1346
alternative hypothesis: two.sided
```

The Fisher exact test *p* value is also 0.13. Either way, there is insufficient evidence to conclude that there is a (true) difference in the distributions of responses.


## Accuracy of Death Certificates (A 6x3 Table)

The table below compiles data from six studies designed to investigate the accuracy of death certificates. The original citation is Kircher T, Nelson J, Burdo H (1985) The autopsy as a measure of accuracy of the death certificate. *NEJM*, 313, 1263-1269.  5373 autopsies were compared to the causes of death listed on the certificates. Of those, 3726 were confirmed to be accurate, 783 either lacked information or contained inaccuracies but did not require recoding of the underlying cause of death, and 864 were incorrect and required recoding.  Do the results across studies appear consistent?

Date of Study | [Confirmed] Accurate | [Inaccurate] No Change | [Incorrect] Recoding | Total
:-----------: | :------------------: | :--------------------: | :------------------: | :---:
1955-1965 | 2040 | 367 | 327 | 2734
1970 | 149 | 60 | 48 | 257
1970-1971 | 288 | 25 | 70 | 383
1975-1977 | 703 | 197 | 252 | 1152
1977-1978 | 425 | 62 | 88 | 575
1980 | 121 | 72 | 79 | 272
Total | 3726 | 783 | 864 | 5373

## The Pearson Chi-Square Test of Independence

We can assess the homogeneity of the confirmation results (columns) we observe in the table using a Pearson chi-squared test of independence.

- The null hypothesis is that the rows and columns are independent.
- The alternative hypothesis is that there is an association between the rows and the columns.


```r
death.tab <- matrix(c(2040,367,327,149,60,48,288,25,70,703,
                      197,252,425,62,88,121,72,79), byrow=TRUE, nrow=6)
rownames(death.tab) <- c("1955-65", "1970", "1970-71", "1975-77", "1977-78",
                 "1980")
colnames(death.tab) <- c("Confirmed", "Inaccurate", "Incorrect")
 
addmargins(death.tab)
```

```
        Confirmed Inaccurate Incorrect  Sum
1955-65      2040        367       327 2734
1970          149         60        48  257
1970-71       288         25        70  383
1975-77       703        197       252 1152
1977-78       425         62        88  575
1980          121         72        79  272
Sum          3726        783       864 5373
```

To see the potential heterogeneity across rows in these data, we should perhaps also look at the proportions of autopsies in each of the three accuracy categories for each study.


```r
addmargins(round(100*prop.table(death.tab,1),1),2) 
```

```
        Confirmed Inaccurate Incorrect Sum
1955-65      74.6       13.4      12.0 100
1970         58.0       23.3      18.7 100
1970-71      75.2        6.5      18.3 100
1975-77      61.0       17.1      21.9 100
1977-78      73.9       10.8      15.3 100
1980         44.5       26.5      29.0 100
```

In three of the studies, approximately 3/4 of the results were confirmed. In the other three, 45%, 58% and 61% were confirmed. It looks like there's a fair amount of variation in results across studies. To see if this is true, formally, we run Pearson's chi-square test of independence, where the null hypothesis is that the rows and columns are independent, and the alternative hypothesis is that there is an association between the rows and the columns.


```r
chisq.test(death.tab)
```

```

	Pearson's Chi-squared test

data:  death.tab
X-squared = 209.09, df = 10, p-value < 2.2e-16
```

The chi-square test statistic is 200 on 10 degrees of freedom, yielding p < 0.0001.

Autopsies are not performed at random; in fact, many are done because the cause of death listed on the certificate is uncertain.  What problems may arise if you attempt to use the results of these studies to make inference about the population as a whole?

## Three-Way Tables: A 2x2xK Table and a Mantel-Haenszel Analysis

The material I discuss in this section is attributable to Jeff Simonoff and his book *Analyzing Categorical Data*. The example is taken from Section 8.1 of that book.

A three-dimensional or three-way table of counts often reflects a situation where the rows and columns refer to variables whose association is of primary interest to us, and the third factor (a layer, or strata) describes a control variable, whose effect on our primary association is something we are *controlling* for in the analysis.

### Smoking and Mortality in the UK

In the early 1970s and then again 20 years later, in Whickham, United Kingdom, surveys yielded the following relationship between whether a person was a smoker at the time of the original survey and whether they were still alive 20 years later\footnote{See Appleton et al. 1996. Ignoring a Covariate: An Example of Simpson's Paradox. The American Statistician, 50, 340-341.}.


```r
whickham1 <- matrix(c(502, 230, 443, 139), byrow=TRUE, nrow=2)
rownames(whickham1) <- c("Non-Smoker", "Smoker")
colnames(whickham1) <- c("Alive", "Dead")
addmargins(whickham1)
```

```
           Alive Dead  Sum
Non-Smoker   502  230  732
Smoker       443  139  582
Sum          945  369 1314
```


Here's the two-by-two table analysis.


```r
Epi::twoby2(whickham1)
```

```
2 by 2 table analysis: 
------------------------------------------------------ 
Outcome   : Alive 
Comparing : Non-Smoker vs. Smoker 

           Alive Dead    P(Alive) 95% conf. interval
Non-Smoker   502  230      0.6858    0.6512   0.7184
Smoker       443  139      0.7612    0.7248   0.7941

                                    95% conf. interval
             Relative Risk:  0.9010    0.8427   0.9633
         Sample Odds Ratio:  0.6848    0.5353   0.8761
Conditional MLE Odds Ratio:  0.6850    0.5307   0.8822
    Probability difference: -0.0754   -0.1230  -0.0266

             Exact P-value: 0.0030 
        Asymptotic P-value: 0.0026 
------------------------------------------------------
```

There is a detectable association between smoking and mortality, but it isn't the one you might expect. 

- The odds ratio is 0.68, implying that the odds of having lived were only 68% as large for non-smokers as for smokers.
- Does that mean that smoking is *good* for you?

Not likely. There is a key "lurking" variable here - a variable that is related to both smoking and mortality that is obscuring the actual relationship - namely, age.


### The `whickham` data with age, too

The table below gives the mortality experience separated into subtables by initial age group.


```r
age <- c(rep("18-24", 4), rep("25-34", 4), 
         rep("35-44", 4), rep("45-54", 4), 
         rep("55-64", 4), rep("65-74", 4), 
         rep("75+", 4))
smoking <- c(rep(c("Smoker", "Smoker", "Non-Smoker", "Non-Smoker"), 7))
status <- c(rep(c("Alive", "Dead"), 14))
counts <- c(53, 2, 61, 1, 121, 3, 152, 5,
            95, 14, 114, 7, 103, 27, 66, 12,
            64, 51, 81, 40, 7, 29, 28, 101,
            0, 13, 0, 64)

whickham2 <- tibble(smoking, status, age, counts) %>%
    mutate(smoking = factor(smoking),
           status = factor(status),
           age = factor(age))
```


```r
whickham2
```

```
# A tibble: 28 x 4
   smoking    status age   counts
   <fct>      <fct>  <fct>  <dbl>
 1 Smoker     Alive  18-24     53
 2 Smoker     Dead   18-24      2
 3 Non-Smoker Alive  18-24     61
 4 Non-Smoker Dead   18-24      1
 5 Smoker     Alive  25-34    121
 6 Smoker     Dead   25-34      3
 7 Non-Smoker Alive  25-34    152
 8 Non-Smoker Dead   25-34      5
 9 Smoker     Alive  35-44     95
10 Smoker     Dead   35-44     14
# ... with 18 more rows
```


```r
whick_t2 <- 
    xtabs(counts ~ smoking + status + age, data = whickham2)

whick_t2
```

```
, , age = 18-24

            status
smoking      Alive Dead
  Non-Smoker    61    1
  Smoker        53    2

, , age = 25-34

            status
smoking      Alive Dead
  Non-Smoker   152    5
  Smoker       121    3

, , age = 35-44

            status
smoking      Alive Dead
  Non-Smoker   114    7
  Smoker        95   14

, , age = 45-54

            status
smoking      Alive Dead
  Non-Smoker    66   12
  Smoker       103   27

, , age = 55-64

            status
smoking      Alive Dead
  Non-Smoker    81   40
  Smoker        64   51

, , age = 65-74

            status
smoking      Alive Dead
  Non-Smoker    28  101
  Smoker         7   29

, , age = 75+

            status
smoking      Alive Dead
  Non-Smoker     0   64
  Smoker         0   13
```

The sample odds ratios for remaining Alive comparing Non-Smokers to Smokers for each of these subtables (except the last one, where the odds ratio is undefined because of the zero cells) are calculated using the usual cross-product ratio approach, which yields the following results.

Age Group | Odds Ratio 
--------:  | ---------:
18-24 | 2.30
25-34 | 0.75
35-44 | 2.40
45-54 | 1.44
55-64 | 1.61
65-74 | 1.15
75+   | Undefined


Thus, for all age groups except 25-34 year olds, not smoking appears to be associated with higher odds of remaining alive.

Why? Not surprisingly, there is a strong association between age and mortality, with mortality rates being very low for young people (2.5% for 18-24 year olds) and increasing to 100% for 75+ year olds.

There is also an association between age and smoking, with smoking rates peaking in the 45-54 year old range and then falling off rapidly. In particular, respondents who were 65 and older at the time of the first survey had very low smoking rates (25.4%) but very high mortality rates (85.5%). Smoking was hardly the cause, however, since even among the 65-74 year olds mortality was higher among smokers (80.6%) than it was among non-smokers (78.3%). A flat version of the table (`ftable` in R) can help us with these calculations.


```r
ftable(whick_t2)
```

```
                  age 18-24 25-34 35-44 45-54 55-64 65-74 75+
smoking    status                                            
Non-Smoker Alive         61   152   114    66    81    28   0
           Dead           1     5     7    12    40   101  64
Smoker     Alive         53   121    95   103    64     7   0
           Dead           2     3    14    27    51    29  13
```

### Checking Assumptions: The Woolf test

We can also obtain a test (using the `woolf_test` function, in the `vcd` library) to see if the common odds ratio estimated in the Mantel-Haenszel procedure is reasonable for all age groups. In other words, the Woolf test is a test of the assumption of homogeneous odds ratios across the six age groups. 

If the Woolf test is significant, it suggests that the Cochran-Mantel-Haenszel test is not appropriate, since the odds ratios for smoking and mortality vary too much in the sub-tables by age group. Here, we have the following log odds ratios (estimated using conditional maximum likelihood, rather than cross-product ratios) and the associated Woolf test.


```r
## Next two results use the vcd package
vcd::oddsratio(whick_t2, log = TRUE)
```

```
log odds ratios for smoking and status by age 

      18-24       25-34       35-44       45-54       55-64 
 0.65018114 -0.22473479  0.84069420  0.34608770  0.47421763 
      65-74         75+ 
 0.09933253 -1.56397554 
```

```r
vcd::woolf_test(whick_t2)
```

```

	Woolf-test on Homogeneity of Odds Ratios (no 3-Way
	assoc.)

data:  whick_t2
X-squared = 3.2061, df = 6, p-value = 0.7826
```

As you can see, the Woolf test is not close to our usual standards for statistically detectable results, implying the common odds ratio is at least potentially reasonable for all age groups (or at least the ones under ages 75, where some data are available.)


### The Cochran-Mantel-Haenszel Test

So, the marginal table looking at smoking and mortality combining all age groups isn't the most meaningful summary of the relationship between smoking and mortality. Instead, we need to look at the *conditional* association of smoking and mortality, **given age**, to address our interests.

The null hypothesis would be that, in the population, smoking and mortality are independent within strata formed by age group. In other words, $H_0$ requires that smoking be of no value in predicting mortality once age has been accounted for.

The alternative hypothesis would be that, in the population, smoking and mortality are associated within the strata formed by age group. In other words, $H_A$ requires that smoking be of at least some value in predicting mortality even after age has been accounted for.

We can consider the evidence that helps us choose between these two hypotheses with a Cochran-Mantel-Haenszel test, which is obtained in R through the `mantelhaen.test` function. This test requires us to assume that, in the population and within each age group, the smoking-mortality odds ratio is the same. Essentially, this means that the association of smoking with mortality is the same for older and younger people.


```r
mantelhaen.test(whick_t2, conf.level  = 0.90)
```

```

	Mantel-Haenszel chi-squared test with continuity
	correction

data:  whick_t2
Mantel-Haenszel X-squared = 5.435, df = 1, p-value =
0.01974
alternative hypothesis: true common odds ratio is not equal to 1
90 percent confidence interval:
 1.143198 2.041872
sample estimates:
common odds ratio 
          1.52783 
```

- The Cochran-Mantel-Haenszel test statistic is a bit larger than 5 (after a continuity correction) leading to a *p* value of 0.02, indicating strong rejection of the null hypothesis of conditional independence of smoking and survival given age. 
- The estimated common conditional odds ratio is 1.53. This implies that (adjusting for age) being a non-smoker is associated with 53% higher odds of being alive 20 years later than being a smoker.
- A 90% confidence interval for that common odds ratio is (1.14, 2.04), reinforcing rejection of the null hypothesis of conditional independence (where the odds ratio would be 1).

### Without the Continuity Correction

By default, R presents the Mantel-Haenszel test with a continuity correction, when used for a 2x2xK table. In virtually all cases, go ahead and do this, but as you can see below, the difference it makes in this case is modest.


```r
mantelhaen.test(whick_t2, correct=FALSE, conf.level = 0.90)
```

```

	Mantel-Haenszel chi-squared test without continuity
	correction

data:  whick_t2
Mantel-Haenszel X-squared = 5.8443, df = 1, p-value =
0.01563
alternative hypothesis: true common odds ratio is not equal to 1
90 percent confidence interval:
 1.143198 2.041872
sample estimates:
common odds ratio 
          1.52783 
```


