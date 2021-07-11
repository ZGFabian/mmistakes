---
title: NAs' rabbit hole when subsetting in base R
output:
  md_document:
    preserve_yaml: true
categories: Rstat
tags: [missing data, subsetting]
lang: en
---

This post is about subsetting and recoding a data frame containing some
missing data.

Subsetting and re-coding in base R are *relatively* straightforward.
Emphasis on *relatively* because subsetting is “hard to master because
you need to internalise a number of interrelated concepts:

-   There are six ways to subset atomic vectors.
-   There are three subsetting operators, \[\[, \[, and $.
-   Subsetting operators interact differently with different vector
    types (e.g., atomic vectors, lists, factors, matrices, and data
    frames).
-   Subsetting can be combined with assignment.” ([H. Wickham’s Advanced
    R](https://adv-r.hadley.nz/subsetting.html))

## Default case: no missing data (NAs) in a data frame (df)

Consider the following dataframe:

    df0 <- data.frame(col1 = c(1:3), col2 = c("cat", "mouse", "dog"))
    df0

    ##   col1  col2
    ## 1    1   cat
    ## 2    2 mouse
    ## 3    3   dog

And you want to recode - that is to say assign a new value to - “cat” in
row 1, column 2 (col2). You can do it by subsetting either by (1) value
(i.e. “cat”) or (2) by index like `df0[1,2]`

    df0[df0$col2 == "cat", ]$col2 <- "lion"
    ## same as df0[1,2] or df0[1,]$col2
    df0[which(df0$col2 == "cat"), ] 

    ## [1] col1 col2
    ## <0 rows> (or 0-length row.names)

    df0

    ##   col1  col2
    ## 1    1  lion
    ## 2    2 mouse
    ## 3    3   dog

We have subset rows (observations) based on logical tests. To do so one
should use double equal sign (`==`) as the single one is reserved for
assignment. (`=` is the same as `<-`)

## Subsetting an “NA-polluted” df

However things can be a little bit more complicated when your data frame
contains some missing values (`NA`s). Lets create a new version of our
primitive dataset with an additional `NA` value and try again to change
“cat” to “lion” with the above methods.

### The so called “rabbit hole”: subsetting by value.

    df1 <- data.frame(col1 = c(1:4), col2 = c("cat", "mouse", "dog", NA))
    df1[df1$col2 == "cat", ]$col2 <- "lion"

    ## Error in `[<-.data.frame`(`*tmp*`, df1$col2 == "cat", , value = structure(list(: missing values are not allowed in subscripted assignments of data frames

Note that “cat” has not become “lion” because “missing values are not
allowed in subscripted assignments of data frames”.

### Subsetting by index value is just fine for re-coding

    which(df1$col2 == "cat")

    ## [1] 1

    df1[which(df1$col2 == "cat"), ]$col2 <- "lion" ## same as df1[1,2] or df1[1,]$col2
    df1

    ##   col1  col2
    ## 1    1  lion
    ## 2    2 mouse
    ## 3    3   dog
    ## 4    4  <NA>

### Another way out from rabbit hole

Nevertheless, at the cost of some additional typing one can still subset
a df by value:

    df1[df1$col2 == "lion" & !is.na(df1$col2), ]$col2

    ## [1] "lion"

## Further reading

-   [Subsetting in: H. Wickham’s Advanced
    R](http://adv-r.had.co.nz/https://adv-r.hadley.nz/subsetting.html)
-   [Why do we use arrow as an assignment
    operator?](https://www.r-bloggers.com/2018/09/why-do-we-use-arrow-as-an-assignment-operator/)
