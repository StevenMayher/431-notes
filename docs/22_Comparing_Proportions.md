# Comparing Proportions with Two Independent Samples

Often, when analyzing data from an independent samples design, we are interested in comparing the proportions of subjects that achieve some outcome, across two levels of an exposure, or treatment. In this circumstance, we will first summarize the available data in terms of a 2x2 cross-tabulation, and then apply a series of inferential methods for 2x2 tables to obtain point and interval estimates of interest.

## Loading the Source Code for Love-boost.R


```r
source("data/Love-boost.R")
```

We'll use this for the `twobytwo` function I'll demonstrate shortly.

## A First Example: Ibuprofen and Sepsis Trial

As we saw in a previous Chapter, we are interested in comparing the percentage of patients in each arm of the trial (Ibuprofen vs. Placebo) that showed an improvement in their temperature (`temp_drop` > 0). Our primary interest is in comparing the percentage of Ibuprofen patients whose temperature dropped to the percentage of Placebo patients whose temperature dropped.

- We can summarize the data behind the two proportions we are comparing in a contingency table with two rows which identify the exposure or treatment of interest, and two columns to represent the outcomes of interest.
- In this case, we are comparing two groups of subjects based on treatment (`treat`): those who received Ibuprofen and those who received a placebo. The outcome of interest is whether the subject's temperature dropped (`temp_drop` > 0), or not. 
- In the table, we place the frequency for each combination of a row and a column.
- The rows need to be mutually exclusive and collectively exhaustive: each patient must either receive Ibuprofen or Placebo. Similarly, the columns must meet the same standard: every patient's temperature either drops or does not drop.

Here's the contingency table.


```r
sepsis <- read_csv("data/sepsis.csv",
                   show_col_types = FALSE) %>%
    mutate(treat = factor(treat),
           race = factor(race))


sepsis <- sepsis %>%
    mutate(dropped = ifelse(temp_drop > 0, "Drop", "No Drop"))

sepsis %>% tabyl(treat, dropped) %>% 
    adorn_totals() %>%
    adorn_percentages(denom = "row") %>%
    adorn_pct_formatting(digits = 1) %>%
    adorn_ns(position = "front")
```

```
     treat        Drop     No Drop
 Ibuprofen 107 (71.3%)  43 (28.7%)
   Placebo  80 (53.3%)  70 (46.7%)
     Total 187 (62.3%) 113 (37.7%)
```

In our sample, we observe 71.3% of the 150 Ibuprofen subjects with a positive `temp_drop` as compared to 53.3% of the 150 Placebo subjects. We want to compare these two probabilities (represented using proportions as 0.713 vs. 0.533) to estimate the size of the difference between the proportions with a point estimate and 90% confidence interval.

But there are other comparisons we could make, too. The tricky part is that we have multiple ways to describe the relationship between treatment and outcome. We might compare outcome "risks" directly using the difference in probabilities, or the ratio of the two probabilities, or we might convert the risks to odds, and compare the ratio of those odds. In any case, we'll get different point estimates and confidence intervals, all of which will help us make conclusions about the evidence available in this trial speaking to differences between Ibuprofen and Placebo.

## Relating a Treatment to an Outcome

The question of interest is whether the percentage of subjects whose temperature dropped is different (and probably larger) in the subjects who received Ibuprofen than in those who received the Placebo. 

Treatment Arm | Dropped | Did Not Drop | Total | Proportion who dropped
-------------:| -----------:| --------:| -----:| ---------------------:
Ibuprofen | 107 | 43 | 150 | 0.713
Placebo   | 80 | 70 | 150 | 0.533

In other words, what is the relationship between the treatment and the outcome?

## Definitions of Probability and Odds

- Proportion = Probability = Risk of the trait = number with trait / total
- Odds of having the trait = (number with the trait / number without the trait) to 1

If p is the proportion of subjects with a trait, then the **odds** of having the trait are $\frac{p}{1-p}$ to 1.

So, the probability of a good result (temperature drop) in this case is $\frac{107}{150} = 0.713$ in the Ibuprofen group. The **odds** of a good result are thus $\frac{0.713}{1 - 0.713} = 2.484$ to 1 in the Ibuprofen group.

Treatment Arm | Dropped | Did Not Drop | Total  | Pr(dropped) | Odds(dropped)
-------------:| -----------:| --------:| -----: | ----------: | ----------:
Ibuprofen | 107 | 43 | 150 | 0.713 | 2.484
Placebo   | 80 | 70 | 150 | 0.533 | 1.141

## Defining the Relative Risk

Among the Ibuprofen subjects, the risk of a good outcome (drop in temperature) is 71.3% or, stated as a proportion, 0.713. Among the Placebo subjects, the risk of a good outcome is 53.3% or, stated as a proportion, 0.533.

Our "crude" estimate of the **relative risk** of a good outcome for Ibuprofen subjects as compared to Placebo subjects, is the ratio of these two risks, or 0.713/0.533 = 1.338

- The fact that this relative risk is greater than 1 indicates that the probability of a good outcome is higher for Ibuprofen subjects than for Placebo subjects.
- A relative risk of 1 would indicate that the probability of a good outcome is the same for Ibuprofen subjects and for Placebo subjects.
- A relative risk less than 1 would indicate that the probability of a good outcome is lower for Ibuprofen subjects than for Placebo subjects.

## Defining the Risk Difference

Our "crude" estimate of the **risk difference** of a good outcome for Ibuprofen subjects as compared to Placebo subjects, is 0.713 - 0.533 = 0.180 or 18.0 percentage points.

- The fact that this risk difference is greater than 0 indicates that the probability of a good outcome is higher for Ibuprofen subjects than for Placebo subjects.
- A risk difference of 0 would indicate that the probability of a good outcome is the same for Ibuprofen subjects and for Placebo subjects.
- A risk difference less than 0 would indicate that the probability of a good outcome is lower for Ibuprofen subjects than for Placebo subjects.

## Defining the Odds Ratio, or the Cross-Product Ratio

Among the Ibuprofen subjects, the odds of a good outcome (temperature drop) are 2.484. Among the placebo subjects, the odds of a good outcome (temperature drop) are 1.141.

So our "crude" estimate of the **odds ratio** of a good outcome for Ibuprofen subjects as compared to placebo subjects, is 2.484 / 1.141 = 2.18

Another way to calculate this odds ratio is to calculate the **cross-product ratio**, which is equal to (a x d) / (b x  c), for the 2 by 2 table with counts specified as shown:

A Generic Table | Good Outcome | Bad Outcome
---------------:| ----------:| -----------:
Treatment Group 1 | a | b
Treatment Group 2 | c | d 

So, for our table, we have a = 107, b = 43, c = 80, and d = 70, so  the cross-product ratio is $\frac{107 x 70}{43 x 80} = \frac{7490}{3440} = 2.18$. As expected, this is the same as the "crude" odds ratio estimate.

- The fact that this odds ratio risk is greater than 1 indicates that the odds of a good outcome are higher for Ibuprofen subjects than for Placebo subjects.
- An odds ratio of 1 would indicate that the odds of a good outcome are the same for Ibuprofen subjects and for Placebo subjects.
- An odds ratio less than 1 would indicate that the odds of a good outcome are lower for Ibuprofen subjects than for Placebo subjects.

So, we have several different ways to compare the outcomes across the treatments. Are these differences and ratios large enough to rule out chance?

## Comparing Rates in a 2x2 Table

What is the relationship between the treatment (Ibuprofen vs. Placebo) and the outcome (drop in temperature) in the following two-by-two table?

## The `twobytwo` function in R

I built the `twobytwo` function in R (based on existing functions in the `Epi` library, which you need to have in your installed packages list in order for this to work) to do the work for this problem. All that is required is a single command, and a two-by-two table in standard epidemiological format (with the outcomes in the columns, and the treatments in the rows.) 

Treatment Arm | Dropped | Did Not Drop
-------------:| -----------:| --------:
Ibuprofen | 107 | 43
Placebo   | 80 | 70 

The command just requires you to read off the cells of the table, followed by the labels for the two treatments, then the two outcomes, then a specification of the names of the rows (exposures) and columns (outcomes) from the table, and a specification of the confidence level you desire. We'll use 90% here.

The resulting output follows. 


```r
twobytwo(107, 43, 80, 70, 
         "Ibuprofen", "Placebo", "Dropped", "No Drop",
         conf.level = 0.90)
```

```
2 by 2 table analysis: 
------------------------------------------------------ 
Outcome   : Dropped 
Comparing : Ibuprofen vs. Placebo 

          Dropped No Drop    P(Dropped) 90% conf. interval
Ibuprofen     107      43        0.7133    0.6490   0.7701
Placebo        80      70        0.5333    0.4661   0.5993

                                   90% conf. interval
             Relative Risk: 1.3375    1.1492   1.5567
         Sample Odds Ratio: 2.1773    1.4583   3.2509
Conditional MLE Odds Ratio: 2.1716    1.4177   3.3437
    Probability difference: 0.1800    0.0881   0.2677

             Exact P-value: 0.0019 
        Asymptotic P-value: 0.0014 
------------------------------------------------------
```

### Standard Epidemiological Format

This table is in **standard epidemiological format**, which means that:

- The rows of the table describe the "treatment" (which we'll take here to be `treat`). The more interesting (sometimes also the more common) "treatment" is placed in the top row. That's Ibuprofen here.
- The columns of the table describe the "outcome" (which we'll take here to be whether the subject's temperature dropped.) Typically, the more common "outcome" is placed to the left. 

### Outcome Probabilities and Confidence Intervals Within the Treatment Groups

The `twobytwo` output starts with estimates of the probability (risk) of a "Dropped" outcome among subjects who fall into the two treatment groups (Ibuprofen or Placebo), along with 90% confidence intervals for each of these probabilities. 

```
2 by 2 table analysis: 
------------------------------------------------------ 
Outcome   : Dropped 
Comparing : Ibuprofen vs. Placebo 

          Dropped No Drop    P(Dropped) 90% conf. interval
Ibuprofen     107      43        0.7133    0.6490   0.7701
Placebo        80      70        0.5333    0.4661   0.5993
```

The conditional probability of a temperature drop given that the subject is in the Ibuprofen group, is symbolized as Pr(Dropped | Ibuprofen) = 0.7133, and the 90% confidence interval around that proportion is (0.6490, 0.7701).

- Note that these two confidence intervals fail to overlap, and so we expect to see a fairly large difference in the estimated probability of a temperature drop when we compare Ibuprofen to Placebo. 

### Relative Risk, Odds Ratio and Risk Difference, with Confidence Intervals

These elements are followed by estimates of the relative risk, odds ratio, and risk difference, each with associated 90% confidence intervals.

```
                                   90% conf. interval
             Relative Risk: 1.3375    1.1492   1.5567
         Sample Odds Ratio: 2.1773    1.4583   3.2509
Conditional MLE Odds Ratio: 2.1716    1.4177   3.3437
    Probability difference: 0.1800    0.0881   0.2677
```

- The **relative risk**, or the ratio of P(Temperature Drop | Ibuprofen) to P(Temperature Drop | Placebo), is shown first. Note that the 90% confidence interval is entirely greater than 1. 
- The **odds ratio** is presented using two different definitions (the sample odds ratio is the cross-product ratio we mentioned earlier). Note that the 90% confidence interval using either approach is entirely greater than 1.
- The **probability** (or risk) **difference** [P(Temperature Drop | Ibuprofen) - P(Temperature Drop | Placebo)] is presented last. Note that the 90% confidence interval is entirely greater than 0.
- Note carefully that if there had been no difference between Ibuprofen and Placebo, the relative risk and odds ratios would be 1, but the probability difference would be zero.

## Estimating a Rate More Accurately: Use (x + 2)/(n + 4) rather than x/n

Suppose you have some data involving n independent tries, with x successes. A natural estimate of the "success rate" in the data is x / n. 

But, strangely enough, it turns out this isn't an entirely satisfying estimator. Alan Agresti provides substantial motivation for the (x + 2)/(n + 4) estimate as an alternative\footnote{This note comes largely from a May 15 2007 entry in Andrew Gelman's blog at http://andrewgelman.com/2007/05/15}. This is sometimes called a *Bayesian augmentation*.

- The big problem with x / n is that it estimates p = 0 or p = 1 when x = 0 or x = n. 
- It's also tricky to compute confidence intervals at these extremes, since the usual standard error for a proportion, $\sqrt{n p (1-p)}$, gives zero, which isn't quite right. 
- (x + 2)/(n + 4) is much cleaner, especially when you build a confidence interval for the rate. 
- The only place where (x + 2)/(n + 4) will go wrong is if n is small and the true probability is very close to 0 or 1. 

For example, if n = 10, and p is 1 in a million, then x will almost certainly be zero, and an estimate of 1/12 is much worse than the simple 0/10. However, how big a deal is this?  If p might be 1 in a million, you're not going to estimate it with a n = 10 experiment\footnote{Andrew Gelman's example is "I'm not going to try ten 100-foot golf putts, miss all of them, and then estimate my probability of success as 1/12."}.

Applying this method to our Ibuprofen and Sepsis Trial data, we would simply add two to each frequency in the main four cells in our 2x2 table.

So instead of using


```r
twobytwo(107, 43, 80, 70, 
         "Ibuprofen", "Placebo", "Dropped", "No Drop",
         conf.level = 0.90)
```

the Bayesian augmentation would encourage us to look at 


```r
twobytwo(109, 45, 82, 72, 
         "Ibuprofen", "Placebo", "Dropped", "No Drop",
         conf.level = 0.90)
```

```
2 by 2 table analysis: 
------------------------------------------------------ 
Outcome   : Dropped 
Comparing : Ibuprofen vs. Placebo 

          Dropped No Drop    P(Dropped) 90% conf. interval
Ibuprofen     109      45        0.7078    0.6441   0.7643
Placebo        82      72        0.5325    0.4662   0.5977

                                   90% conf. interval
             Relative Risk: 1.3293    1.1434   1.5453
         Sample Odds Ratio: 2.1268    1.4337   3.1550
Conditional MLE Odds Ratio: 2.1215    1.3950   3.2421
    Probability difference: 0.1753    0.0845   0.2622

             Exact P-value: 0.0022 
        Asymptotic P-value: 0.0016 
------------------------------------------------------
```

As you can see, the odds ratio and relative risk estimates are (a little) closer to 1, and the probability difference is also a little closer to 0. The Bayesian augmentation provides a slightly more conservative set of estimates of the impact of Ibuprofen as compared to Placebo.

It is likely that the augmented version is a more accurate estimate here, but the two estimates will be comparable, generally, so long as either (a) the sample size in each exposure group is more than, say, 30 subjects, and/or (b) the sample probability of the outcome is between 10% and 90% in each exposure group. 

## A Second Example: Ebola Virus Disease Study, again

For instance, recall the Ebola Virus Disease study from the *New England Journal of Medicine* that we described in the previous Chapter. Suppose we want to compare the proportion of deaths among cases that had a definitive outcome who were hospitalized to the proportion of deaths among cases that had a definitive outcome who were not hospitalized.

The article suggests that of the 1,737 cases with a definitive outcome, there were 1,153 hospitalized cases. Across those 1,153 hospitalized cases, 741 people (64.3%) died, which means that across the remaining 584 non-hospitalized cases, 488 people (83.6%) died.

Here is the initial contingency table, using only the numbers from the previous paragraph.

Initial Ebola Table | Deceased | Alive | Total
------------------:| -------: | ----: | ----:
Hospitalized | 741 | -- | 1153
Not Hospitalized | 488 | -- | 584
Total | | | 1737

Now, we can use arithmetic to complete the table, since the rows and the columns are each mutually exclusive and collectively exhaustive.

Ebola 2x2 Table | Deceased | Alive | Total
------------------:| -------: | ----: | ----:
Hospitalized | 741 | 412 | 1153
Not Hospitalized | 488 | 96 | 584
Total | 1229 | 508 | 1737

We want to compare the fatality risk (probability of being in the deceased column) for the population of people in the hospitalized row to the population of people in the not hospitalized row. 

We can run these data through R, using the Bayesian augmentation (adding a death and a survival to the hospitalized and also to the not hospitalized groups.) We'll use a 95% confidence level this time.


```r
twobytwo(741+2, 412+2, 488+2, 96+2, 
         "Hospitalized", "Not Hospitalized", "Deceased", "Alive",
         conf.level = 0.95)
```

```
2 by 2 table analysis: 
------------------------------------------------------ 
Outcome   : Deceased 
Comparing : Hospitalized vs. Not Hospitalized 

                 Deceased Alive    P(Deceased) 95% conf.
Hospitalized          743   414         0.6422    0.6141
Not Hospitalized      490    98         0.8333    0.8010
                 interval
Hospitalized       0.6693
Not Hospitalized   0.8613

                                    95% conf. interval
             Relative Risk:  0.7706    0.7285   0.8151
         Sample Odds Ratio:  0.3589    0.2801   0.4599
Conditional MLE Odds Ratio:  0.3591    0.2772   0.4624
    Probability difference: -0.1912   -0.2307  -0.1490

             Exact P-value: 0.0000 
        Asymptotic P-value: 0.0000 
------------------------------------------------------
```

I'll leave it as an exercise for you to interpret these results and draw some conclusions.


