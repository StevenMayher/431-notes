# example R options set globally
options(width = 60)

# example chunk options set globally
knitr::opts_chunk$set(
  comment = NA,
  collapse = FALSE
  )

# packages included globally

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
library(broom) 
library(tidyverse) 

# set b/w theme for graphics by default

theme_set(theme_bw())