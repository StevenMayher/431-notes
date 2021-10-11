# Power and Proportions

## Loading the Source Code for Love-boost.R


```r
source("data/Love-boost.R")
```

Again, we'll use this for the `twobytwo` function I'll demonstrate shortly.

## Tuberculosis Prevalence Among IV Drug Users

Consider a study to investigate factors affecting tuberculosis prevalence among intravenous drug users. The original data source is Graham NMH et al. (1992) Prevalence of Tuberculin Positivity and Skin Test Anergy in HIV-1-Seropositive and Seronegative Intravenous Drug Users. *JAMA*, 267, 369-373. Among 97 individuals who admit to sharing needles, 24 (24.7%) had a positive tuberculin skin test result; among 161 drug users who deny sharing needles, 28 (17.4%) had a positive test result.  To start, we'll test the null hypothesis that the proportions of intravenous drug users who have a positive tuberculin skin test result are identical for those who share needles and those who do not.


```r
twobytwo(24, 73, 28, 133, 
         "Sharing Needles", "Not Sharing", 
         "TB test+", "TB test-")
```

```
2 by 2 table analysis: 
------------------------------------------------------ 
Outcome   : TB test+ 
Comparing : Sharing Needles vs. Not Sharing 

                TB test+ TB test-    P(TB test+) 95% conf.
Sharing Needles       24       73         0.2474    0.1717
Not Sharing           28      133         0.1739    0.1229
                interval
Sharing Needles   0.3427
Not Sharing       0.2404

                                   95% conf. interval
             Relative Risk: 1.4227    0.8772   2.3073
         Sample Odds Ratio: 1.5616    0.8439   2.8898
Conditional MLE Odds Ratio: 1.5588    0.8014   3.0191
    Probability difference: 0.0735   -0.0265   0.1807

             Exact P-value: 0.1996 
        Asymptotic P-value: 0.1557 
------------------------------------------------------
```

What conclusions should we draw?

## Designing a New TB Study

Now, suppose we wanted to design a new study with as many non-sharers as needle-sharers participating, and suppose that we wanted to detect any difference in the proportion of positive skin test results between the two groups that was identical to the data presented above or larger with at least 90% power, using a two-sided test and $\alpha$ = .05. What sample size would be required to accomplish these aims?

## Using `power.prop.test` for Balanced Designs

Our constraints are that we want to find the sample size for a two-sample comparison of proportions using a balanced design, we will use $\alpha$ = .05, and power = .90, and that we estimate that the non-sharers will have a .174 proportion of positive tests, and we will try to detect a difference between this group and the needle sharers, who we estimate will have a proportion of .247, using a two-sided hypothesis test.


```r
power.prop.test(p1 = .174, p2  = .247, sig.level = 0.05, power = 0.90)
```

```

     Two-sample comparison of proportions power calculation 

              n = 653.2876
             p1 = 0.174
             p2 = 0.247
      sig.level = 0.05
          power = 0.9
    alternative = two.sided

NOTE: n is number in *each* group
```

So, we'd need at least 654 non-sharing subjects, and 654 more who share needles to accomplish the aims of the study.

## How `power.prop.test` works

`power.prop.test` works much like the `power.t.test` we saw for means. 

Again, we specify 4 of the following 5 elements of the comparison, and R calculates the fifth.

- The sample size (interpreted as the # in each group, so half the total sample size)
- The true probability in group 1
- The true probability in group 2
- The significance level ($\alpha$)
- The power (1 - $\beta$)

The big weakness with the `power.prop.test` tool is that it doesn't allow you to work with unbalanced designs.

## A Revised Scenario

Suppose we can get exactly 800 subjects in total (400 sharing and 400 non-sharing).  How much power would we have to detect a difference in the proportion of positive skin test results between the two groups that was identical to the data presented above or larger, using a one-sided test, with $\alpha$ = .10?


```r
power.prop.test(n=400, p1=.174, p2=.247, sig.level = 0.10,
                alternative="one.sided")
```

```

     Two-sample comparison of proportions power calculation 

              n = 400
             p1 = 0.174
             p2 = 0.247
      sig.level = 0.1
          power = 0.8954262
    alternative = one.sided

NOTE: n is number in *each* group
```

We would have just under 90% power to detect such an effect.

## Using the `pwr` library for Unbalanced Designs

The `pwr.2p2n.test` function in the `pwr` library can help assess the power of a test to determine a particular effect size using an unbalanced design, where $n_1$ is not equal to $n_2$. 

As before, we specify four of the following five elements of the comparison, and R calculates the fifth.

- `n1` = The sample size in group 1
- `n2` = The sample size in group 2
- `sig.level` = The significance level ($\alpha$)
- `power` = The power (1 - $\beta$)
- `h` = the effect size h, which can be calculated separately in R based on the two proportions being compared: `p1` and `p2`.

### Calculating the Effect Size `h`

To calculate the effect size for a given set of proportions, just use `ES.h(p1, p2)` which is available in the `pwr` library.

For instance, in our comparison, we have the following effect size.


```r
pwr::ES.h(p1 = .174, p2 = .247)
```

```
[1] -0.1796783
```

## Using `pwr.2p2n.test` in R

Suppose we can have 700 samples in group 1 (the not sharing group) but only half that many in group 2 (the group of users who share needles). How much power would we have to detect this same difference ($p_1$ = .174, $p_2$ = .247) with a 5% significance level in a two-sided test?


```r
pwr::pwr.2p2n.test(h = pwr::ES.h(p1 = .174, p2 = .247), 
              n1 = 700, n2 = 350,
              sig.level = 0.05)
```

```

     difference of proportion power calculation for binomial distribution (arcsine transformation) 

              h = 0.1796783
             n1 = 700
             n2 = 350
      sig.level = 0.05
          power = 0.7836768
    alternative = two.sided

NOTE: different sample sizes
```

Note that the headline for this output actually reads:

```
difference of proportion power calculation for binomial distribution 
(arcsine transformation) 
```

It appears we will have about 78% power under these circumstances.

### Comparison to Balanced Design

How does this compare to the results with a balanced design using only 1000 drug users in total, so that we have 500 patients in each group?


```r
pwr::pwr.2p2n.test(h = pwr::ES.h(p1 = .174, p2 = .247), 
                   n1 = 500, n2 = 500, sig.level = 0.05)
```

```

     difference of proportion power calculation for binomial distribution (arcsine transformation) 

              h = 0.1796783
             n1 = 500
             n2 = 500
      sig.level = 0.05
          power = 0.8108416
    alternative = two.sided

NOTE: different sample sizes
```

or we could instead have used...


```r
power.prop.test(p1 = .174, p2 = .247, 
                sig.level = 0.05, n = 500)
```

```

     Two-sample comparison of proportions power calculation 

              n = 500
             p1 = 0.174
             p2 = 0.247
      sig.level = 0.05
          power = 0.8091808
    alternative = two.sided

NOTE: n is number in *each* group
```

Note that these two sample size estimation approaches are approximations, and use slightly different approaches, so it's not surprising that the answers are similar, but not completely identical.


