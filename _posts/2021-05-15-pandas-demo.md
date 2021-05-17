---
layout: single
classes: wide
categories: [python, social statistics]
title: "Getting started with Python pandas"
tags: [python, pandas]
layout: single
classes: wide
categories: [python, social statistics]
tags: [python, pandas]
---

## What to do with Python's pandas library?

[Pandas](https://pandas.pydata.org/) is a fast, powerful, flexible and easy to use open source data analysis and manipulation tool, built on top of the Python programming language.

### Ask Python itself what is pandas!

```python
import pandas
pandas?
```
Here is some of the output:

> **pandas** is a Python package providing fast, flexible, and expressive data
structures designed to make working with "relational" or "labeled" data both
easy and intuitive. It aims to be the fundamental high-level building block for
doing practical, **real world** data analysis in Python. Additionally, it has
the broader goal of becoming **the most powerful and flexible open source data
analysis / manipulation tool available in any language**. It is already well on
its way toward this goal.

Main Features
-------------
&ldquo;Here are just a few of the things that pandas does well:

- Easy handling of missing data in floating point as well as non-floating
  point data.
- Size mutability: columns can be inserted and deleted from DataFrame and
  higher dimensional objects
- Automatic and explicit data alignment: objects can be explicitly aligned
  to a set of labels, or the user can simply ignore the labels and let
  `Series`, `DataFrame`, etc. automatically align the data for you in
  computations.
- Powerful, flexible group by functionality to perform split-apply-combine
  operations on data sets, for both aggregating and transforming data.&rdquo;
  (...)

Want to know more? Run `pandas??`! To save some typing pandas can be imported as pd like `import pandas as pd`. So `pd??` will do it as well.

## Go on with some real world example...

We shall import `os`, `plotly` (as plotly.express) and `pandas` and load our example `gapminder` dataset as `DataFrame`.
Now we import `os`, `plotly` (as plotly.express) and `pandas` modules than load our example `gapminder` dataset as `DataFrame`. Note: that this intro example is created as a [jupyter-lab notebook]({{ site.baseurl }}/assets/img/21-05-15-pandas-demo/pandas-demo.ipynb), that is also exported to a [python script]({{ site.baseurl }}/assets/img/21-05-15-pandas-demo/pandas-demo.py). Results were exported to markdown and [pdf]({{ site.baseurl }}/assets/img/21-05-15-pandas-demo/pandas-demo.pdf). In order to render markdown correctly in Jekyll, some minor modification were needed. See the modified markdown file on github.


```python
import os
import plotly.express as px
import pandas as pd
df = px.data.gapminder()  # n.b. there is a separate module for gapminder data
type(df)
```

    pandas.core.frame.DataFrame

Have a look at some attributes and descriptive statistics of our DataFrame. 

```python
df.head(5)
```

<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>country</th>
      <th>continent</th>
      <th>year</th>
      <th>lifeExp</th>
      <th>pop</th>
      <th>gdpPercap</th>
      <th>iso_alpha</th>
      <th>iso_num</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Afghanistan</td>
      <td>Asia</td>
      <td>1952</td>
      <td>28.801</td>
      <td>8425333</td>
      <td>779.445314</td>
      <td>AFG</td>
      <td>4</td>
    </tr>
    <tr>
      <th>1</th>
      <td>Afghanistan</td>
      <td>Asia</td>
      <td>1957</td>
      <td>30.332</td>
      <td>9240934</td>
      <td>820.853030</td>
      <td>AFG</td>
      <td>4</td>
    </tr>
    <tr>
      <th>2</th>
      <td>Afghanistan</td>
      <td>Asia</td>
      <td>1962</td>
      <td>31.997</td>
      <td>10267083</td>
      <td>853.100710</td>
      <td>AFG</td>
      <td>4</td>
    </tr>
    <tr>
      <th>3</th>
      <td>Afghanistan</td>
      <td>Asia</td>
      <td>1967</td>
      <td>34.020</td>
      <td>11537966</td>
      <td>836.197138</td>
      <td>AFG</td>
      <td>4</td>
    </tr>
    <tr>
      <th>4</th>
      <td>Afghanistan</td>
      <td>Asia</td>
      <td>1972</td>
      <td>36.088</td>
      <td>13079460</td>
      <td>739.981106</td>
      <td>AFG</td>
      <td>4</td>
    </tr>
  </tbody>
</table>
</div>

```python
df.shape  #without parents!
```

    (1704, 8)

```python
pd.set_option('display.float_format', lambda x: '%.1f' % x)  # set number of digits
df.describe()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>year</th>
      <th>lifeExp</th>
      <th>pop</th>
      <th>gdpPercap</th>
      <th>iso_num</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>count</th>
      <td>1704.0</td>
      <td>1704.0</td>
      <td>1704.0</td>
      <td>1704.0</td>
      <td>1704.0</td>
    </tr>
    <tr>
      <th>mean</th>
      <td>1979.5</td>
      <td>59.5</td>
      <td>29601212.3</td>
      <td>7215.3</td>
      <td>425.9</td>
    </tr>
    <tr>
      <th>std</th>
      <td>17.3</td>
      <td>12.9</td>
      <td>106157896.7</td>
      <td>9857.5</td>
      <td>248.3</td>
    </tr>
    <tr>
      <th>min</th>
      <td>1952.0</td>
      <td>23.6</td>
      <td>60011.0</td>
      <td>241.2</td>
      <td>4.0</td>
    </tr>
    <tr>
      <th>25%</th>
      <td>1965.8</td>
      <td>48.2</td>
      <td>2793664.0</td>
      <td>1202.1</td>
      <td>208.0</td>
    </tr>
    <tr>
      <th>50%</th>
      <td>1979.5</td>
      <td>60.7</td>
      <td>7023595.5</td>
      <td>3531.8</td>
      <td>410.0</td>
    </tr>
    <tr>
      <th>75%</th>
      <td>1993.2</td>
      <td>70.8</td>
      <td>19585221.8</td>
      <td>9325.5</td>
      <td>638.0</td>
    </tr>
    <tr>
      <th>max</th>
      <td>2007.0</td>
      <td>82.6</td>
      <td>1318683096.0</td>
      <td>113523.1</td>
      <td>894.0</td>
    </tr>
  </tbody>
</table>
</div>




```python
df["country"].value_counts()
```




    Nicaragua           12
    Gambia              12
    Rwanda              12
    Cambodia            12
    Congo, Dem. Rep.    12
                        ..
    Sudan               12
    Swaziland           12
    Peru                12
    Bulgaria            12
    Costa Rica          12
    Name: country, Length: 142, dtype: int64


## Filtering DataFrame

1. Select the most recent year. 

```python
df["year"].max()
```

    2007

Exclude all previous years and keep 2007 only with a query. 

```python
df.query('year == 2007')
```


<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>country</th>
      <th>continent</th>
      <th>year</th>
      <th>lifeExp</th>
      <th>pop</th>
      <th>gdpPercap</th>
      <th>iso_alpha</th>
      <th>iso_num</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>11</th>
      <td>Afghanistan</td>
      <td>Asia</td>
      <td>2007</td>
      <td>43.8</td>
      <td>31889923</td>
      <td>974.6</td>
      <td>AFG</td>
      <td>4</td>
    </tr>
    <tr>
      <th>23</th>
      <td>Albania</td>
      <td>Europe</td>
      <td>2007</td>
      <td>76.4</td>
      <td>3600523</td>
      <td>5937.0</td>
      <td>ALB</td>
      <td>8</td>
    </tr>
    <tr>
      <th>35</th>
      <td>Algeria</td>
      <td>Africa</td>
      <td>2007</td>
      <td>72.3</td>
      <td>33333216</td>
      <td>6223.4</td>
      <td>DZA</td>
      <td>12</td>
    </tr>
    <tr>
      <th>47</th>
      <td>Angola</td>
      <td>Africa</td>
      <td>2007</td>
      <td>42.7</td>
      <td>12420476</td>
      <td>4797.2</td>
      <td>AGO</td>
      <td>24</td>
    </tr>
    <tr>
      <th>59</th>
      <td>Argentina</td>
      <td>Americas</td>
      <td>2007</td>
      <td>75.3</td>
      <td>40301927</td>
      <td>12779.4</td>
      <td>ARG</td>
      <td>32</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th>1655</th>
      <td>Vietnam</td>
      <td>Asia</td>
      <td>2007</td>
      <td>74.2</td>
      <td>85262356</td>
      <td>2441.6</td>
      <td>VNM</td>
      <td>704</td>
    </tr>
    <tr>
      <th>1667</th>
      <td>West Bank and Gaza</td>
      <td>Asia</td>
      <td>2007</td>
      <td>73.4</td>
      <td>4018332</td>
      <td>3025.3</td>
      <td>PSE</td>
      <td>275</td>
    </tr>
    <tr>
      <th>1679</th>
      <td>Yemen, Rep.</td>
      <td>Asia</td>
      <td>2007</td>
      <td>62.7</td>
      <td>22211743</td>
      <td>2280.8</td>
      <td>YEM</td>
      <td>887</td>
    </tr>
    <tr>
      <th>1691</th>
      <td>Zambia</td>
      <td>Africa</td>
      <td>2007</td>
      <td>42.4</td>
      <td>11746035</td>
      <td>1271.2</td>
      <td>ZMB</td>
      <td>894</td>
    </tr>
    <tr>
      <th>1703</th>
      <td>Zimbabwe</td>
      <td>Africa</td>
      <td>2007</td>
      <td>43.5</td>
      <td>12311143</td>
      <td>469.7</td>
      <td>ZWE</td>
      <td>716</td>
    </tr>
  </tbody>
</table>
<p>142 rows × 8 columns</p>
</div>



We got a df with 142 rows which is equal to the number of countries. And this is so `True`.


```python
len(df.country.unique()) == len(df.query('year == 2007'))
```




    True


Which country has the lowest life expectancy in Europe in 2007? First print the value.

```python
df.query('year == 2007 & continent == "Europe"')["lifeExp"].min()
```




    71.777



What country has the highest life expectancy worldwide?


```python
maxLE = df['lifeExp'].max()
df[df['lifeExp'] == maxLE]
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>country</th>
      <th>continent</th>
      <th>year</th>
      <th>lifeExp</th>
      <th>pop</th>
      <th>gdpPercap</th>
      <th>iso_alpha</th>
      <th>iso_num</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>803</th>
      <td>Japan</td>
      <td>Asia</td>
      <td>2007</td>
      <td>82.603</td>
      <td>127467972</td>
      <td>31656.06806</td>
      <td>JPN</td>
      <td>392</td>
    </tr>
  </tbody>
</table>
</div>



What country has the highest life expectancy in each continent?


```python
df.groupby("continent").max("lifeExp")
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>year</th>
      <th>lifeExp</th>
      <th>pop</th>
      <th>gdpPercap</th>
      <th>iso_num</th>
    </tr>
    <tr>
      <th>continent</th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>Africa</th>
      <td>2007</td>
      <td>76.442</td>
      <td>135031164</td>
      <td>21951.21176</td>
      <td>894</td>
    </tr>
    <tr>
      <th>Americas</th>
      <td>2007</td>
      <td>80.653</td>
      <td>301139947</td>
      <td>42951.65309</td>
      <td>862</td>
    </tr>
    <tr>
      <th>Asia</th>
      <td>2007</td>
      <td>82.603</td>
      <td>1318683096</td>
      <td>113523.13290</td>
      <td>887</td>
    </tr>
    <tr>
      <th>Europe</th>
      <td>2007</td>
      <td>81.757</td>
      <td>82400996</td>
      <td>49357.19017</td>
      <td>826</td>
    </tr>
    <tr>
      <th>Oceania</th>
      <td>2007</td>
      <td>81.235</td>
      <td>20434176</td>
      <td>34435.36744</td>
      <td>554</td>
    </tr>
  </tbody>
</table>
</div>




```python
df.groupby(['continent'], sort=False)['lifeExp'].max()
```




    continent
    Asia        82.603
    Europe      81.757
    Africa      76.442
    Americas    80.653
    Oceania     81.235
    Name: lifeExp, dtype: float64



Well, mission completed, but we are still lack the name of the countries :-( So copy paste from [here](https://stackoverflow.com/a/15705958).


```python
idx = df.groupby(['continent'])['lifeExp'].transform(max) == df['lifeExp']
df[idx]

```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>country</th>
      <th>continent</th>
      <th>year</th>
      <th>lifeExp</th>
      <th>pop</th>
      <th>gdpPercap</th>
      <th>iso_alpha</th>
      <th>iso_num</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>71</th>
      <td>Australia</td>
      <td>Oceania</td>
      <td>2007</td>
      <td>81.235</td>
      <td>20434176</td>
      <td>34435.367440</td>
      <td>AUS</td>
      <td>36</td>
    </tr>
    <tr>
      <th>251</th>
      <td>Canada</td>
      <td>Americas</td>
      <td>2007</td>
      <td>80.653</td>
      <td>33390141</td>
      <td>36319.235010</td>
      <td>CAN</td>
      <td>124</td>
    </tr>
    <tr>
      <th>695</th>
      <td>Iceland</td>
      <td>Europe</td>
      <td>2007</td>
      <td>81.757</td>
      <td>301931</td>
      <td>36180.789190</td>
      <td>ISL</td>
      <td>352</td>
    </tr>
    <tr>
      <th>803</th>
      <td>Japan</td>
      <td>Asia</td>
      <td>2007</td>
      <td>82.603</td>
      <td>127467972</td>
      <td>31656.068060</td>
      <td>JPN</td>
      <td>392</td>
    </tr>
    <tr>
      <th>1271</th>
      <td>Reunion</td>
      <td>Africa</td>
      <td>2007</td>
      <td>76.442</td>
      <td>798094</td>
      <td>7670.122558</td>
      <td>REU</td>
      <td>638</td>
    </tr>
  </tbody>
</table>
</div>



Now, look at the minimum values by continent! But remember to filter for the most recent data.


```python
df2 = df.query('year == 2007')
idx = df2.groupby(['continent'])['lifeExp'].transform(min) == df2['lifeExp']
df2[idx]
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>country</th>
      <th>continent</th>
      <th>year</th>
      <th>lifeExp</th>
      <th>pop</th>
      <th>gdpPercap</th>
      <th>iso_alpha</th>
      <th>iso_num</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>11</th>
      <td>Afghanistan</td>
      <td>Asia</td>
      <td>2007</td>
      <td>43.828</td>
      <td>31889923</td>
      <td>974.580338</td>
      <td>AFG</td>
      <td>4</td>
    </tr>
    <tr>
      <th>647</th>
      <td>Haiti</td>
      <td>Americas</td>
      <td>2007</td>
      <td>60.916</td>
      <td>8502814</td>
      <td>1201.637154</td>
      <td>HTI</td>
      <td>332</td>
    </tr>
    <tr>
      <th>1103</th>
      <td>New Zealand</td>
      <td>Oceania</td>
      <td>2007</td>
      <td>80.204</td>
      <td>4115771</td>
      <td>25185.009110</td>
      <td>NZL</td>
      <td>554</td>
    </tr>
    <tr>
      <th>1463</th>
      <td>Swaziland</td>
      <td>Africa</td>
      <td>2007</td>
      <td>39.613</td>
      <td>1133066</td>
      <td>4513.480643</td>
      <td>SWZ</td>
      <td>748</td>
    </tr>
    <tr>
      <th>1583</th>
      <td>Turkey</td>
      <td>Europe</td>
      <td>2007</td>
      <td>71.777</td>
      <td>71158647</td>
      <td>8458.276384</td>
      <td>TUR</td>
      <td>792</td>
    </tr>
  </tbody>
</table>
</div>

Ta da! It is **Turkey** that had the lowest life expectancy in Europe according to the example dataset.
Finally, a quick plot of the results with Pandas-only way (i.e. we shall not use `plotly`'s advanced capabilities).

```python
ax = df2[idx].plot.bar(x='country', y='lifeExp', rot=0)
```
    
![png]({{ site.baseurl }}/assets/img/21-05-15-pandas-demo/pandas-bar.png)
    

