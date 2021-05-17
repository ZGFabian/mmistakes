---
layout: single
classes: wide
categories: [python, social statistics]
tags: [python, pandas]
---
# Getting started with Python pandas

## What is pandas?

[Pandas](https://pandas.pydata.org/) is a fast, powerful, flexible and easy to use open source data analysis and manipulation tool, built on top of the Python programming language.

### Ask Python itself what is pandas!


```python
import pandas
pandas?
```
**pandas** is a Python package providing fast, flexible, and expressive data
structures designed to make working with "relational" or "labeled" data both
easy and intuitive. It aims to be the fundamental high-level building block for
doing practical, **real world** data analysis in Python. Additionally, it has
the broader goal of becoming **the most powerful and flexible open source data
analysis / manipulation tool available in any language**. It is already well on
its way toward this goal.
    
Main Features
-------------
Here are just a few of the things that pandas does well:
    
- Easy handling of missing data in floating point as well as non-floating
  point data.
- Size mutability: columns can be inserted and deleted from DataFrame and
  higher dimensional objects
- Automatic and explicit data alignment: objects can be explicitly aligned
  to a set of labels, or the user can simply ignore the labels and let
  `Series`, `DataFrame`, etc. automatically align the data for you in
  computations.
- Powerful, flexible group by functionality to perform split-apply-combine
  operations on data sets, for both aggregating and transforming data.
- Make it easy to convert ragged, differently-indexed data in other Python
  and NumPy data structures into DataFrame objects.
- Intelligent label-based slicing, fancy indexing, and subsetting of large
  data sets.
- Intuitive merging and joining data sets.
- Flexible reshaping and pivoting of data sets.
- Hierarchical labeling of axes (possible to have multiple labels per tick).
- Robust IO tools for loading data from flat files (CSV and delimited),
  Excel files, databases, and saving/loading data from the ultrafast HDF5
  format.
- Time series-specific functionality: date range generation and frequency
  conversion, moving window statistics, date shifting and lagging.



If you want a more detailed answer run `pandas??`. To save some typing pandas can be imported as pd like `import pandas as pd`.

## Go on with a real world example...

We shall import `os`, `plotly` (as plotly.express) and `pandas` and load our example `gapminder` dataset as `DataFrame`.


```python
import os
import plotly.express as px
import pandas as pd
df = px.data.gapminder()
type(df)
```
    pandas.core.frame.DataFrame

```python

```
