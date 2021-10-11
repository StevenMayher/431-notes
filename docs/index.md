--- 
title: "Data Science for Biological, Medical and Health Research: Notes for PQHS/CRSP/MPHP 431"
author: "Thomas E. Love"
date: "2021-10-11"
site: bookdown::bookdown_site
documentclass: book
bibliography: [book.bib, packages.bib]
url: https://thomaselove.github.io/431-notes/
biblio-style: apalike
link-citations: yes
github-repo: thomaselove/431-notes
description: "This book provides examples of some fundamental approaches to doing biostatistical and data science in research."
csl: chicago-fullnote-bibliography.csl
---

# Working with These Notes {-}

1. This document is broken down into multiple chapters. Use the table of contents on the left side of the screen to navigate between chapters, or use the right side to navigate within the current chapter.
2. You can also search the document, using an automated index.
3. Any of the code provided in the document can be copied to the clipboard using the Copy icon at the top right of the code block.
4. The document will be updated (unpredictably) throughout the semester.

## The 431 Course online {-}

The **main web page** for the 431 course in Fall 2021 is https://thomaselove.github.io/431/. Go there for all information related to the course.

<img src="figures/431_foot2.PNG" width="80%" style="display: block; margin: auto;" />

## What You'll Find Here {-}

These Notes provide a series of examples using R to work through issues that are likely to come up in PQHS/CRSP/MPHP 431. What you will mostly find are brief explanations of a key idea or summary, accompanied (most of the time) by R code and a demonstration of the results of applying that code. 

While these Notes share some of the features of a textbook, they are neither comprehensive nor completely original. The main purpose is to give 431 students a set of common materials on which to draw during the course. In class, we will sometimes:

- reiterate points made in this document, 
- amplify what is here,
- simplify the presentation of things done here,
- use new examples to show some of the same techniques,
- refer to issues not mentioned in this document,

but what we don't do is follow these notes very precisely. We assume instead that you will read the materials and try to learn from them, just as you will attend classes and try to learn from them. We welcome feedback of all kinds on this document or anything else.

Everything you see here is available to you as HTML. You also have access to the R Markdown files, which contain the code which generates everything in the document, including all of the R results. We will demonstrate the use of R Markdown (this document is generated with the additional help of an R package called `bookdown`) and RStudio (the "program" we use to interface with the R language) in class. 

All data and R code related to these notes are also available to you.

## Setting Up R {-}

These Notes make extensive use of 

- the statistical software language R, and
- the development environment R Studio,

both of which are free, and you'll need to install them on your machine. Instructions for doing so are in found in the course syllabus.

If you need an even gentler introduction, or if you're just new to R and RStudio and need to learn about them, we encourage you to take a look at http://moderndive.com/, which provides an introduction to statistical and data sciences via R at @ModernDive.

These notes were written using R Markdown. R Markdown, like R and R Studio, is free and open source.

R Markdown is described as an *authoring framework* for data science, which lets you

- save and execute R code
- generate high-quality reports that can be shared with an audience

This description comes from http://rmarkdown.rstudio.com/lesson-1.html which you can visit to get an overview and quick tour of what's possible with R Markdown.

Another excellent resource to learn more about R Markdown tools is the Communicate section (especially the R Markdown chapter) of @R4DS.

## Initial Setup of R Packages {-}

To start, I'll present a series of commands I run (silently) at the beginning of each chapter of these Notes. These particular commands set up R to use several packages (libraries) of functions that expand its capabilities, make a specific change to how I want R output to be displayed (that's the `comment = NA` piece) and sets the theme for most of the graphs I will build to one called `theme_bw()`. A chunk of code like this will occur near the top of any R Markdown work.


```r
knitr::opts_chunk$set(comment = NA)

library(knitr)
library(magrittr)
library(janitor)
library(NHANES)
library(palmerpenguins)
library(patchwork)
library(rms)
library(mosaic)
library(Epi)
library(naniar)
library(simputation)
library(broom) # note: tidymodels includes the broom package
library(tidyverse) # note: tidyverse includes the dplyr and ggplot2 packages

theme_set(theme_bw())
```

I have deliberately set up this list of loaded packages to be relatively small. You only need to install a package once, but you need to reload it every time you start a new session.

## The `Love-boost.R` script {-}

Starting in October, we'll make use of a few scripts I've gathered for you. When necessary, I'll source in some code using the following command...


```r
source("data/Love-boost.R")
```

## Additional R Packages installed for this book {-}

Some packages need to be installed on the user's system, but do not need to be loaded by R in order to run the code presented in these notes except in very specific settings. These additional packages include the following.


```
boot
car
equatiomatic
GGally
ggridges
gt
psych
modelsummary
visdat
```

