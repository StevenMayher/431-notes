# Hypothesis Testing: What is it good for?

Hypothesis testing uses sample data to attempt to reject the hypothesis that nothing interesting is happening -- that is, to reject the notion that chance alone can explain the sample results\footnote{Some of this is adapted from @GoodHardin, and @Utts1999}. We can, in many settings, use confidence intervals to summarize the results, as well, and confidence intervals and hypothesis tests are closely connected. 

In particular, it's worth stressing that:

- **A significant effect is not necessarily the same thing as an interesting effect.**  For example, results calculated from large samples are nearly always "significant" even when the effects are quite small in magnitude.  Before doing a test, always ask if the effect is large enough to be of any practical interest.  If not, why do the test?

- **A non-significant effect is not necessarily the same thing as no difference.**  A large effect of real practical interest may still produce a non-significant result simply because the sample is too small.

- **There are assumptions behind all statistical inferences.** Checking assumptions is crucial to validating the inference made by any test or confidence interval.

## Five Steps in any Hypothesis Test

1.	Specify the null hypothesis, $H_0$ (which usually indicates that there is no difference or no association between the results in various groups of subjects)
2.	Specify the research or alternative hypothesis, $H_A$, sometimes called $H_1$ (which usually indicates that there is some difference or some association between the results in those same groups of subjects).
3.	Specify the test procedure or test statistic to be used to make inferences to the population based on sample data. Here is where we usually specify $\alpha$, the probability of incorrectly rejecting $H_0$ that we are willing to accept. In the absence of other information, we often use $\alpha = 0.05$
4.	Obtain the data, and summarize it to obtain the relevant test statistic, which gets summarized as a $p$ value.
5.	Use the $p$ value to either
    - **reject** $H_0$ in favor of the alternative $H_A$ (concluding that there is a statistically significant difference/association at the $\alpha$ significance level) or
    - **retain** $H_0$ (and conclude that there is no statistically significant difference/association at the $\alpha$ significance level)

## Type I and Type II Error

Once we know how unlikely the results would have been if the null hypothesis were true, we must make one of two choices:

1. The *p* value is not small enough to convincingly rule out chance.  Therefore, we cannot reject the null hypothesis as an explanation for the results.
2. The *p* value was small enough to convincingly rule out chance.  We reject the null hypothesis and accept the alternative hypothesis.

How small must the *p* value be in order to rule out the null hypothesis?  The standard choice is 5%.  This standardization has some substantial disadvantages\footnote{Ingelfinger JA, Mosteller F, Thibodeau LA and Ware JH (1987) Biostatistics in Clinical Medicine, 2nd Edition, New York: MacMillan. pp. 156-157.}. It is simply a convention that has become accepted over the years, and there are many situations for which a 5% cutoff is unwise. While it does give a specific level to keep in mind, it suggests a rather mindless cutpoint having nothing to do with the importance of the decision nor the costs or losses associated with outcomes.



## The Courtroom Analogy

Consider the analogy of the jury in a courtroom.

1.	The evidence is not strong enough to convincingly rule out that the defendant is innocent.  Therefore, we cannot reject the null hypothesis, or innocence of the defendant.
2.	The evidence was strong enough that we are willing to rule out the possibility that an innocent person (as stated in the null hypothesis) produced the observed data.  We reject the null hypothesis, that the defendant is innocent, and assert the alternative hypothesis.

Consistent with our thinking in hypothesis testing, in many cases we would not accept the hypothesis that the defendant is innocent.  We would simply conclude that the evidence was not strong enough to rule out the possibility of innocence.

The *p* value is the probability of getting a result as extreme or more extreme than the one observed if the proposed null hypothesis is true.  Notice that it is not valid to actually accept that the null hypothesis is true.  To do so would be to say that we are essentially convinced that chance alone produced the observed results -- a common mistake.

## Significance vs. Importance

Remember that a statistically significant relationship or difference does not necessarily mean an important one.  A result that is significant in the statistical meaning of the word may not be significant clinically.  Statistical significance is a technical term.  Findings can be both statistically significant and practically significant or either or neither.

When we have large samples, we will regularly find small differences that have a small *p* value even though they have no practical importance.  At the other extreme, with small samples, even large differences will often not be large enough to create a small *p* value. The notion of statistical significance has not helped science, and we won't perpetuate it any further.

## What does Dr. Love dislike about *p* values and "statistical significance"?

A lot of things. A major issue is that I believe that *p* values are impossible to explain in a way that is both [a] technically correct and [b] straightforward at the same time. As evidence of this, you might want to look at [this article and associated video by Christie Aschwanden at 538.com](http://fivethirtyeight.com/features/statisticians-found-one-thing-they-can-agree-on-its-time-to-stop-misusing-p-values/) 

The notion of a *p* value was an incredibly impressive achievement back when Wald and others were doing the work they were doing in the 1940s, and might still have been useful as recently as 10 years ago. But the notion of a *p* value relies on a lot of flawed assumptions, and null hypothesis significance testing is fraught with difficulties. Nonetheless, researchers use *p* values every day. 

## The ASA Articles in 2016 and 2019 on Statistical Significance and P-Values

However, my primary motivation for taking the approach I'm taking comes from the pieces in two key reference collections we'll read and discuss more thoroughly in 431 and 432.

1. The American Statistical Association's 2016 [Statement on p-Values](http://amstat.tandfonline.com/doi/full/10.1080/00031305.2016.1154108): Context, Process and Purpose.

> The ASA Statement on p-Values and Statistical Significance (Wasserstein and Lazar 2016) was developed primarily because after decades, warnings about the don'ts had gone mostly unheeded. The statement was about what not to do, because there is widespread agreement about the don'ts.

2. [Statistical Inference in the 21st Century: A World Beyond *p* < 0.05](https://amstat.tandfonline.com/toc/utas20/73/sup1) from 2019 in *The American Statistician*

> This is a world where researchers are free to treat "p = 0.051" and "p = 0.049" as not being categorically different, where authors no longer find themselves constrained to selectively publish their results based on a single magic number. In this world, where studies with "p < 0.05" and studies with "p > 0.05" are not automatically in conflict, researchers will see their results more easily replicated-and, even when not, they will better understand why. As we venture down this path, we will begin to see fewer false alarms, fewer overlooked discoveries, and the development of more customized statistical strategies. Researchers will be free to communicate all their findings in all their glorious uncertainty, knowing their work is to be judged by the quality and effective communication of their science, and not by their p-values. As "statistical significance" is used less, statistical thinking will be used more. The ASA Statement on P-Values and Statistical Significance started moving us toward this world.... Now we must go further.

> The ASA Statement on P-Values and Statistical Significance stopped just short of recommending that declarations of "statistical significance" be abandoned. We take that step here. We conclude, based on our review of the articles in this special issue and the broader literature, that it is time to stop using the term "statistically significant" entirely. Nor should variants such as "significantly different," "p < 0.05," and "nonsignificant" survive, whether expressed in words, by asterisks in a table, or in some other way.... Regardless of whether it was ever useful, a declaration of "statistical significance" has today become meaningless.

For the moment, I will say this. I emphasize confidence intervals over *p* values, which is at best a partial solution. But ...

1. Very rarely does a situation emerge in which a *p* value can be available in which looking at the associated confidence interval isn't far more helpful for making a comparison of interest.
2. The use of a *p* value requires making at least as many assumptions about the population, sample, individuals and data as does a confidence interval.
3. Most null hypotheses are clearly not exactly true prior to data collection, and so the test summarized by a *p* value is of questionable value most of the time.
4. No one has a truly adequate definition of a *p* value, in terms of both precision and parsimony. Brief, understandable definitions always fail to be technically accurate.
5. Bayesian approaches avoid some of these pitfalls, but come with their own issues.
6. Many smart people agree with me, and have sworn off of *p* values whenever they can.

Again, we'll look at these issues in greater depth later in the course.

## Errors in Hypothesis Testing

In testing hypotheses, there are two potential decisions and each one brings with it the possibility that a mistake has been made.  

Let's use the courtroom analogy.  Here are the potential choices and associated potential errors.  Although the seriousness of errors depends on the seriousness of the crime and punishment, the potential error for choice 2 is usually more serious.

1. We cannot rule out that the defendant is innocent, so (s)he is set free without penalty.
    - Potential Error: A criminal has been erroneously freed.
2. We believe that there is enough evidence to conclude that the defendant is guilty.
    - Potential Error: An innocent person is convicted / penalized and a guilty person remains free.

As another example, consider being tested for disease.  Most tests for diseases are not 100% accurate.  The lab technician or physician must make a choice:

1. In the opinion of the medical practitioner, you are healthy.  The test result was weak enough to be called "negative" for the disease.
    - Potential Error: You actually have the disease but have been told that you do not.  This is called a **false negative**.
2. In the opinion of the medical practitioner, you have the disease.  The test results were strong enough to be called "positive" for the disease.
    - Potential Error: You are actually healthy but have been told you have the disease.  This is called a **false positive**.


## The Two Types of Hypothesis Testing Errors

-- | $H_A$ is true | $H_0$ is true
-----------------:| :----------------------------:| :---------------------------:
Test Rejects $H_0$ | Correct Decision | Type I Error (False Positive) 
Test Retains $H_0$ | Type II Error (False Negative) | Correct Decision

- A Type I error can only be made if the null hypothesis is actually true.
- A Type II error can only be made if the alternative hypothesis is actually true.

## The Significance Level is the Probability of a Type I Error

If the null hypothesis is true, the *p* value is the probability of making an error by choosing the alternative hypothesis instead.  Alpha ($\alpha$) is defined as the probability of rejecting the null hypothesis when the null hypothesis is actually true, creating a Type I error. This is also called the significance level, so that 100(1-$\alpha$) is the confidence level -- the probability of correctly concluding that there is no difference (retaining $H_0$) when the null hypothesis is true.


## The Probability of avoiding a Type II Error is called Power

A Type II error is made if the alternative hypothesis is true, but you fail to choose it.  The probability depends on exactly which part of the alternative hypothesis is true, so that computing the probability of making a Type II error is not feasible.  The power of a test is the probability of making the correct decision when the alternative hypothesis is true.  Beta ($\beta$) is defined as the probability of concluding that there was no difference, when in fact there was one (a Type II error).  Power is then just 1 - $\beta$, the probability of concluding that there was a difference, when, in fact, there was one.  

Traditionally, people like the power of a test to be at least 80%, meaning that $\beta$ is at most 0.20. Often, I'll be arguing for 90% as a minimum power requirement, or we'll be presenting a range of power calculations for a variety of sample size choices.

## Incorporating the Costs of Various Types of Errors

Which error is more serious in medical testing, where we think of our $H_0$: patient is healthy vs. $H_A$: disease is present?

It depends on the disease and on the consequences of a negative or positive test result.  A false negative in a screening test for cancer could lead to a fatal delay in treatment, whereas a false positive would probably lead to a retest.  A more troublesome example occurs in testing for an infectious disease.  Inevitably, there is a trade-off between the two types of errors.  It all depends on the consequences.

It would be nice if we could specify the probability that we were making an error with each potential decision.  We could then weigh the consequence of the error against its probability.  Unfortunately, in most cases, we can only specify the conditional probability of making a Type I error, given that the null hypothesis is true.  

In deciding whether to reject a null hypothesis, we will need to consider the consequences of the two potential types of errors.  If a Type I error is very serious, then you should reject the null hypothesis only if the *p* value is very small.  Conversely, if a Type II error is more serious, you should be willing to reject the null hypothesis with a larger *p* value, perhaps 0.10 or 0.20, instead of 0.05.

- $\alpha$ is the probability of rejecting $H_0$ when $H_0$ is true.
    - So 1 - $\alpha$, the confidence level, is the probability of retaining $H_0$ when that's the right thing to do.
- $\beta$ is the probability of retaining $H_0$ when $H_A$ is true.
    - So 1 - $\beta$, the power, is the probability of rejecting $H_0$ when that's the right thing to do.

-- | $H_A$ is True | $H_0$ is True
--:| :--------------------------------------:| :-------------------------------------:
Test Rejects $H_0$ | Correct Decision (1 - $\beta$) | Type I Error ($\alpha$)
Test Retains $H_0$ | Type II Error ($\beta$) | Correct Decision (1 - $\alpha$)

## Power and Sample Size Considerations

For most statistical tests, it is theoretically possible to estimate the power of the test in the design stage, (before any data are collected) for various sample sizes, so we can hone in on a sample size choice which will enable us to collect data only on as many subjects as are truly necessary. 

A power calculation is likely the most common element of an scientific grant proposal on which a statistician is consulted. This is a fine idea in theory, but in practice...

- The tests that have power calculations worked out in intensive detail using R are mostly those with more substantial assumptions. Examples include t tests that assume population normality, common population variance and balanced designs in the independent samples setting, or paired t tests that assume population normality in the paired samples setting. 
- These power calculations are also usually based on tests rather than confidence intervals, which would be much more useful in most settings. Simulation is your friend here.
- Even more unfortunately, this process of doing power and related calculations is **far more of an art than a science**. 
- As a result, the value of many power calculations is negligible, since the assumptions being made are so arbitrary and poorly connected to real data. 
- On several occasions, I have stood in front of a large audience of medical statisticians actively engaged in clinical trials and other studies that require power calculations for funding. When I ask for a show of hands of people who have had power calculations prior to such a study whose assumptions matched the eventual data perfectly, I get lots of laughs. It doesn't happen.
- Even the underlying framework that assumes a power of 80% with a significance level of 5% is sufficient for most studies is pretty silly. 

All that said, I feel obliged to show you some examples of power calculations done using R, and provide some insight on how to make some of the key assumptions in a way that won't alert reviewers too much to the silliness of the enterprise. All of the situations described in this Chapter are toy problems, but they may be instructive about some fundamental ideas.

## Sample Size in a One-Sample t test

For a t test, R can estimate any one of the following elements, given the other four, using the `power.t.test` command, for either a one-tailed or two-tailed single-sample t test...

- n = the sample size 
- $\delta$ = delta = the true difference in population means between the null hypothesis value and a particular alternative
- s = sd = the true standard deviation of the population
- $\alpha$ = sig.level = the significance level for the test (maximum acceptable risk of Type I error)
- 1 - $\beta$ = power = the power of the t test to detect the effect of size $\delta$

### A Toy Example

Suppose that in a recent health survey, the average beef consumption in the U.S. per person was 90 pounds per year. Suppose you are planning a new study to see if beef consumption levels have changed. You plan to take a random sample of 25 people to build your new estimate, and test whether the current pounds of beef consumed per year is 90. Suppose you want to do a two-sided (two-tailed) test at 95% confidence (so $\alpha$ = 0.05), and that you expect that the true difference will need to be at least $\delta$ = 5 pounds (i.e. 85 or less or 95 or more) in order for the result to be of any real, practical interest. Suppose also that you are willing to assume that the true standard deviation of the measurements in the population is 10 pounds.

That is, of course, a lot to suppose.

Now, we want to know what power the proposed experiment will have to detect a change of 5 pounds (or more) away from the original 90 pounds, with these specifications, and how tweaking these specifications will affect the power of the study.

So, we have
- n = 25 data points to be collected
- $\delta$ = 5 pounds is the minimum clinically meaningful effect size
- s = 10 is the assumed population standard deviation, in pounds per year
- $\alpha$ is 0.05, and we'll do a two-sided test

### Using the `power.t.test` function


```r
power.t.test(n = 25, delta = 5, sd = 10, sig.level = 0.05, 
             type="one.sample", alternative="two.sided")
```

```

     One-sample t test power calculation 

              n = 25
          delta = 5
             sd = 10
      sig.level = 0.05
          power = 0.6697014
    alternative = two.sided
```

So, under this study design, we would expect to detect an effect of size $\delta$ = 5 pounds with just under 67% power, i.e. with a probability of incorrect retention of $H_0$ of just about 1/3. Most of the time, we'd like to improve this power, and to do so, we'd need to adjust our assumptions.

## Changing Assumptions 

We made assumptions about the sample size n, the minimum clinically meaningful effect size (change in the population mean) $\delta$, the population standard deviation s, and the significance level $\alpha$, not to mention decisions about the test, like that we'd do a one-sample t test, rather than another sort of test for a single sample, and that we'd do a two-tailed, or two-sided test. Often, these assumptions are tweaked a bit to make the power look more like what a reviewer/funder is hoping to see.

### Increasing Sample Size Increases Power

Suppose, we committed to using more resources and gathering data from 40 subjects instead of the 25 we assumed initially -- what effect would this have on our power?


```r
power.t.test(n = 40, delta = 5, sd = 10, sig.level = 0.05, 
             type="one.sample", alternative="two.sided")
```

```

     One-sample t test power calculation 

              n = 40
          delta = 5
             sd = 10
      sig.level = 0.05
          power = 0.8693979
    alternative = two.sided
```

With more samples, we should have a more powerful test, able to detect the difference with greater probability. In fact, a sample of 40 paired differences yields 87% power. As it turns out, we would need at least 44 observations with this scenario to get to 90% power, as shown in the calculation below, which puts the power in, but leaves out the sample size.


```r
power.t.test(power=0.9, delta = 5, sd = 10, sig.level = 0.05, 
             type="one.sample", alternative="two.sided")
```

```

     One-sample t test power calculation 

              n = 43.99552
          delta = 5
             sd = 10
      sig.level = 0.05
          power = 0.9
    alternative = two.sided
```

We see that we would need at least 44 observations to achieve 90% power. Note: we always round the sample size up in doing a power calculation -- if this calculation had actually suggested n = 43.1 paired differences were needed, we would still have rounded up to 44.

### Increasing Effect Size will increase Power

A larger effect should be easier to detect. If we go back to our original calculation, which had 67% power to detect an effect of size $\delta$ = 5, and now change the desired effect size to $\delta$ = 6 pounds (i.e. a value of 84 or less or 96 or more), we should obtain a more powerful design.


```r
power.t.test(n = 25, delta = 6, sd = 10, sig.level = 0.05, 
             type="one.sample", alternative="two.sided")
```

```

     One-sample t test power calculation 

              n = 25
          delta = 6
             sd = 10
      sig.level = 0.05
          power = 0.8207213
    alternative = two.sided
```

We see that this change in effect size from 5 to 6, leaving everything else the same, increases our power from 67% to 82%. To reach 90% power, we'd need to increase the effect size we were trying to detect to at least 6.76 pounds. 


```r
power.t.test(n = 25, power = 0.9, sd = 10, sig.level = 0.05, 
             type="one.sample", alternative="two.sided")
```

```

     One-sample t test power calculation 

              n = 25
          delta = 6.759051
             sd = 10
      sig.level = 0.05
          power = 0.9
    alternative = two.sided
```

- Again, note that I am rounding up here. 
- Using $\delta$ = 6.75 would not quite make it to 90.00% power. 
- Using $\delta$ = 6.76 guarantees that the power will be 90% or more, and not just round up to 90%.

### Decreasing the Standard Deviation will increase Power

The choice of standard deviation is usually motivated by a pilot study, or else pulled out of thin air - it's relatively easy to convince yourself that the true standard deviation might be a little smaller than you'd guessed initially. Let's see what happens to the power if we reduce the sample standard deviation from 10 pounds to 9. This should make the effect of 5 pounds easier to detect, because it will have smaller variation associated with it.


```r
power.t.test(n = 25, delta = 5, sd = 9, sig.level = 0.05, 
             type="one.sample", alternative="two.sided")
```

```

     One-sample t test power calculation 

              n = 25
          delta = 5
             sd = 9
      sig.level = 0.05
          power = 0.759672
    alternative = two.sided
```

This change in standard deviation from 10 to 9, leaving everything else the same, increases our power from 67% to nearly 76%. To reach 90% power, we'd need to decrease the standard deviation of the population paired differences to no more than 7.39 pounds. 


```r
power.t.test(n = 25, delta = 5, sd = NULL, power = 0.9, sig.level = 0.05, 
             type="one.sample", alternative="two.sided")
```

```

     One-sample t test power calculation 

              n = 25
          delta = 5
             sd = 7.397486
      sig.level = 0.05
          power = 0.9
    alternative = two.sided
```

Note I am rounding down here. 

- Using s = 7.4 pounds would not quite make it to 90.00% power.

Note also that in order to get R to treat the standard debviation as unknown, I must specify it as NULL in the formula.

### Larger Significance Level increases Power

We can trade off some of our Type II error (lack of power) for Type I error. If we are willing to trade off some Type I error (as described by the $\alpha$), we can improve the power. For instance, suppose we decided to run the original test with 90% confidence. 


```r
power.t.test(n = 25, delta = 5, sd = 10, sig.level = 0.1, 
             type="one.sample", alternative="two.sided")
```

```

     One-sample t test power calculation 

              n = 25
          delta = 5
             sd = 10
      sig.level = 0.1
          power = 0.7833861
    alternative = two.sided
```

The calculation suggests that our power would thus increase from 67% to just over 78%.

## Paired Sample t Tests and Power/Sample Size

For a paired-samples t test, R can estimate any one of the following elements, given the other four, using the `power.t.test` command, for either a one-tailed or two-tailed paired t test...

- n = the sample size (# of pairs) being compared
- $\delta$ = delta = the true difference in means between the two groups
- s = sd = the true standard deviation of the paired differences
- $\alpha$ = sig.level = the significance level for the comparison (maximum acceptable risk of Type I error)
- 1 - $\beta$ = power = the power of the paired t test to detect the effect of size $\delta$

### A Toy Example

As a toy example, suppose you are planning a paired samples experiment involving n = 30 subjects who will each provide a "Before" and an "After" result, which is measured in days.

Suppose you want to do a two-sided (two-tailed) test at 95% confidence (so $\alpha$ = 0.05), and that you expect that the true difference between the "Before" and "After" groups will have to be at least $\delta$ = 5 days to be of any real interest. Suppose also that you are willing to assume that the true standard deviation of those paired differences will be 10 days.

That is, of course, a lot to suppose.

Now, we want to know what power the proposed experiment will have to detect this difference with these specifications, and how tweaking these specifications will affect the power of the study.

So, we have
- n = 30 paired differences will be collected
- $\delta$ = 5 days is the minimum clinically meaningful difference
- s = 10 days is the assumed population standard deviation of the paired differences
- $\alpha$ is 0.05, and we'll do a two-sided test

### Using the `power.t.test` function


```r
power.t.test(n = 30, delta = 5, sd = 10, sig.level = 0.05, 
             type="paired", alternative="two.sided")
```

```

     Paired t test power calculation 

              n = 30
          delta = 5
             sd = 10
      sig.level = 0.05
          power = 0.7539627
    alternative = two.sided

NOTE: n is number of *pairs*, sd is std.dev. of *differences* within pairs
```

So, under this study design, we would expect to detect an effect of size $\delta$ = 5 days with 75% power, i.e. with a probability of incorrect retention of $H_0$ of 0.25. Most of the time, we'd like to improve this power, and to do so, we'd need to adjust our assumptions.

### Changing Assumptions in a Power Calculation

We made assumptions about the sample size n, the minimum clinically meaningful difference in means $\delta$, the population standard deviation s, and the significance level $\alpha$, not to mention decisions about the test, like that we'd do a paired t test, rather than another sort of test for paired samples, or use an independent samples approach, and that we'd do a two-tailed, or two-sided test. Often, these assumptions are tweaked a bit to make the power look more like what a reviewer/funder is hoping to see.

### Changing the Sample Size

Suppose, we committed to using more resources and gathering "Before" and "After" data from 40 subjects instead of the 30 we assumed initially -- what effect would this have on our power?


```r
power.t.test(n = 40, delta = 5, sd = 10, sig.level = 0.05, 
             type="paired", alternative="two.sided")
```

```

     Paired t test power calculation 

              n = 40
          delta = 5
             sd = 10
      sig.level = 0.05
          power = 0.8693979
    alternative = two.sided

NOTE: n is number of *pairs*, sd is std.dev. of *differences* within pairs
```

With more samples, we should have a more powerful test, able to detect the difference with greater probability. In fact, a sample of 40 paired differences yields 87% power. As it turns out, we would need at least 44 paired differences with this scenario to get to 90% power, as shown in the calculation below, which puts the power in, but leaves out the sample size.


```r
power.t.test(power=0.9, delta = 5, sd = 10, sig.level = 0.05, 
             type="paired", alternative="two.sided")
```

```

     Paired t test power calculation 

              n = 43.99552
          delta = 5
             sd = 10
      sig.level = 0.05
          power = 0.9
    alternative = two.sided

NOTE: n is number of *pairs*, sd is std.dev. of *differences* within pairs
```

We see that we would need at least 44 paired differences to achieve 90% power. Note: we always round the sample size up in doing a power calculation -- if this calculation had actually suggested n = 43.1 paired differences were needed, we would still have rounded up to 44.

### Changing the Effect Size

A larger effect should be easier to detect. If we go back to our original calculation, which had 75% power to detect an effect (i.e. a true population mean difference) of size $\delta$ = 5, and now change the desired effect size to $\delta$ = 6, we should obtain a more powerful design.


```r
power.t.test(n = 30, delta = 6, sd = 10, sig.level = 0.05, 
             type="paired", alternative="two.sided")
```

```

     Paired t test power calculation 

              n = 30
          delta = 6
             sd = 10
      sig.level = 0.05
          power = 0.887962
    alternative = two.sided

NOTE: n is number of *pairs*, sd is std.dev. of *differences* within pairs
```

We see that this change in effect size from 5 to 6, leaving everything else the same, increases our power from 75% to nearly 89%. To reach 90% power, we'd need to increase the effect size we were trying to detect to at least 6.13 days. 

- Again, note that I am rounding up here. 
- Using $\delta$ = 6.12 would not quite make it to 90.00% power. 
- Using $\delta$ = 6.13 guarantees that the power will be 90% or more, and not just round up to 90%..

### Changing the Standard Deviation

The choice of standard deviation is usually motivated by a pilot study, or else pulled out of thin air. It's relatively easy to convince yourself that the true standard deviation might be a little smaller than you'd guessed initially. Let's see what happens to the power if we reduce the sample standard deviation from 10 days to 9 days. This should make the effect of 5 days easier to detect as being different from the null hypothesized value of 0, because it will have smaller variation associated with it.


```r
power.t.test(n = 30, delta = 5, sd = 9, sig.level = 0.05, 
             type="paired", alternative="two.sided")
```

```

     Paired t test power calculation 

              n = 30
          delta = 5
             sd = 9
      sig.level = 0.05
          power = 0.8366514
    alternative = two.sided

NOTE: n is number of *pairs*, sd is std.dev. of *differences* within pairs
```

This change in standard deviation from 10 to 9, leaving everything else the same, increases our power from 75% to nearly 84%. To reach 90% power, we'd need to decrease the standard deviation of the population paired differences to no more than 8.16 days. 

Note I am rounding down here, because using $s$ = 8.17 days would not quite make it to 90.00% power. Note also that in order to get R to treat the sd as unknown, I must specify it as NULL in the formula... 


```r
power.t.test(n = 30, delta = 5, sd = NULL, power = 0.9, 
             sig.level = 0.05, type="paired", alternative="two.sided")
```

```

     Paired t test power calculation 

              n = 30
          delta = 5
             sd = 8.163989
      sig.level = 0.05
          power = 0.9
    alternative = two.sided

NOTE: n is number of *pairs*, sd is std.dev. of *differences* within pairs
```

### Changing the Significance Level

We can trade off some of our Type II error (lack of power) for Type I error. If we are willing to trade off some Type I error (as described by the $\alpha$), we can improve the power. For instance, suppose we decided to run the original test with 90% confidence. 


```r
power.t.test(n = 30, delta = 5, sd = 10, sig.level = 0.1, 
             type="paired", alternative="two.sided")
```

```

     Paired t test power calculation 

              n = 30
          delta = 5
             sd = 10
      sig.level = 0.1
          power = 0.8482542
    alternative = two.sided

NOTE: n is number of *pairs*, sd is std.dev. of *differences* within pairs
```

The calculation suggests that our power would thus increase from 75% to nearly 85%.

## Two Independent Samples: Power for t Tests

For an independent-samples t test, with a balanced design (so that $n_1$ = $n_2$), R can estimate any one of the following elements, given the other four, using the `power.t.test` command, for either a one-tailed or two-tailed t test...

- n = the sample size in each of the two groups being compared
- $\delta$ = delta = the true difference in means between the two groups
- s = sd = the true standard deviation of the individual values in each group (assumed to be constant -- since we assume equal population variances)
- $\alpha$ = sig.level = the significance level for the comparison (maximum acceptable risk of Type I error)
- 1 - $\beta$ = power = the power of the t test to detect the effect of size $\delta$

This method only produces power calculations for balanced designs -- where the sample size is equal in the two groups. If you want a two-sample power calculation for an unbalanced design, you will need to use a different library and function in R, as we'll see.

## A New Example

Suppose we plan a study of the time to relapse for patients in a drug trial, where subjects will be assigned randomly to a (new) treatment or to a placebo. Suppose we anticipate that the placebo group will have a mean of about 9 months, and want to detect an improvement (increase) in time to relapse of 50%, so that the treatment group would have a mean of at least 13.5 months. We'll use $\alpha$ = .10 and $\beta$ = .10, as well. Assume we'd do a two-sided test, with an equal number of observations in each group, and we'll assume the observed standard deviation of 9 months in a pilot study will hold here, as well.

We want the sample size required by the test under a two sample setting where:

- $\alpha$ = .10, 
- with 90% power (so that $\beta$ = .10), 
- and where we will have equal numbers of samples in the placebo group (group 1) and the treatment group (group 2).  
- We'll plug in the observed standard deviation of 9 months.
- We'll look at detecting a change from 9 [the average in the placebo group] to 13.5 (a difference of 50%, giving delta = 4.5) 
- using a two-sided pooled t-test.  

The appropriate R command is:


```r
power.t.test(delta = 4.5, sd = 9, 
             sig.level = 0.10, power = 0.9, 
             type="two.sample", 
             alternative="two.sided")
```

```

     Two-sample t test power calculation 

              n = 69.19782
          delta = 4.5
             sd = 9
      sig.level = 0.1
          power = 0.9
    alternative = two.sided

NOTE: n is number in *each* group
```

This suggests that we will need a sample of at least 70 subjects in the treated group and an additional 70 subjects in the placebo group, for a total of 140 subjects.

### Another Scenario

What if resources are sparse, and we'll be forced to do the study with no more than 120 subjects, overall? If we require 90% confidence in a two-sided test, what power will we have?


```r
power.t.test(n = 60, delta = 4.5, sd = 9, 
             sig.level = 0.10,
             type="two.sample", 
             alternative="two.sided")
```

```

     Two-sample t test power calculation 

              n = 60
          delta = 4.5
             sd = 9
      sig.level = 0.1
          power = 0.859484
    alternative = two.sided

NOTE: n is number in *each* group
```

It looks like the power under those circumstances would be just under 86%. Note that the n = 60 refers to half of the total sample size, since we'll need 60 drug and 60 placebo subjects in this balanced design.

## Power for Independent Sample T tests with Unbalanced Designs

Using the `pwr` package, R can do sample size calculations that describe the power of a two-sample t test that does not require a balanced design using the `pwr.t2n.test` command.

Suppose we wanted to do the same study as we described above, using 100 "treated" patients but as few "placebo" patients as possible. What sample size would be required to maintain 90% power? There is one change here -- the effect size d in the `pwr.t2n.test` command is specified using the difference in means $\delta$ that we used previously, divided by the standard deviation s that we used previously. So, in our old setup, we assumed delta = 4.5, sd = 9, so now we'll assume d = 4.5/9 instead.


```r
pwr::pwr.t2n.test(n1 = 100, d = 4.5/9, 
             sig.level = 0.1, power = 0.9,
             alternative="two.sided")
```

```

     t test power calculation 

             n1 = 100
             n2 = 52.82433
              d = 0.5
      sig.level = 0.1
          power = 0.9
    alternative = two.sided
```

We would need at least 53 subjects in the "placebo" group.

### The most efficient design for an independent samples comparison will be balanced.

- Note that if we use $n_1$ = 100 subjects in the treated group, we need at least $n_2$ = 53 in the placebo group to achieve 90% power, and a total of 153 subjects. 
- Compare this to the balanced design, where we needed 70 subjects in each group to achieve the same power, thus, a total of 140 subjects. 

We saw earlier that a test with 60 subjects in each group would yield just under 86% power. Suppose we instead built a test with 80 subjects in the treated group, and 40 in the placebo group, then what would our power be?


```r
pwr::pwr.t2n.test(n1 = 80, n2 = 40, d = 4.5/9, 
             sig.level = 0.10,
             alternative="two.sided")
```

```

     t test power calculation 

             n1 = 80
             n2 = 40
              d = 0.5
      sig.level = 0.1
          power = 0.821823
    alternative = two.sided
```

As we'd expect, the power is stronger for a balanced design than for an unbalanced design with the same overall sample size. 

Note that I used a two-sided test to establish my power calculation -- in general, this is the most conservative and defensible approach for any such calculation, **unless there is a strong and specific reason to use a one-sided approach in building a power calculation, don't**.

