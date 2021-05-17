#!/usr/bin/env python
# coding: utf-8
---
layout: single
classes: wide
categories: [python, social statistics]
tags: [python, pandas]
layout: single
classes: wide
categories: [python, social statistics]
tags: [python, pandas, jupyter-lab]
---
# # Getting started with Python pandas

# ## What is pandas?
# 
# [Pandas](https://pandas.pydata.org/) is a fast, powerful, flexible and easy to use open source data analysis and manipulation tool, built on top of the Python programming language.
# 
# ### Ask Python itself what is pandas!

# In[11]:


import pandas
get_ipython().run_line_magic('pinfo', 'pandas')


# Want to know more? Run `pandas??`!. To save some typing pandas can be imported as pd like `import pandas as pd`. So `pd??` will do it as well.
# 
# ## Go on with some real world example...
# 
# Now we import `os`, `plotly` (as plotly.express) and `pandas` modules than load our example `gapminder` dataset as `DataFrame`. Note: that this intro example is created as a jupyter-lab notebook, that is alsa exported to a python script. Results were exported to markdown and pdf. In order to render correctly in Jekyll some minor modification were needed. See the modified Jekyll  on github.

# In[1]:


import os
import plotly.express as px
import pandas as pd
df = px.data.gapminder()  # n.b. there is a separate module for gapminder data
type(df)


# In[ ]:


Have a look at some attributes and descriptive statistics of our DataFrame. 


# In[2]:


df.head(5)


# In[8]:


df.shape  #without parents!


# In[5]:


pd.set_option('display.float_format', lambda x: '%.1f' % x)  # set number of digits
df.describe()


# In[2]:


df["country"].value_counts()


# In[11]:


df["country"]


# ## Filtering DataFrame
# 
# 1. Select the most recent year. 

# In[14]:


df["year"].max()

Exclude all previous years and keep 2007 only with a query. 
# In[15]:


df.query('year == 2007')


# We got a df with 142 rows which is equal to the number of countries. And this is so `True`.

# In[21]:


len(df.country.unique()) == len(df.query('year == 2007'))

Which country has the lowest life expectancy in Europe in 2007? First print the value.
# In[26]:


df.query('year == 2007 & continent == "Europe"')["lifeExp"].min()


# What country has the highest life expectancy worldwide?

# In[21]:


maxLE = df['lifeExp'].max()
df[df['lifeExp'] == maxLE]


# What country has the highest life expectancy in each continent?

# In[24]:


df.groupby("continent").max("lifeExp")


# In[25]:


df.groupby(['continent'], sort=False)['lifeExp'].max()


# Well, mission completed, but we are still lack the name of the countries :-( So copy paste from [here](https://stackoverflow.com/a/15705958).

# In[29]:


idx = df.groupby(['continent'])['lifeExp'].transform(max) == df['lifeExp']
df[idx]


# Now, look at the minimum values by continent! But remember to filter for the most recent data.

# In[31]:


df2 = df.query('year == 2007')
idx = df2.groupby(['continent'])['lifeExp'].transform(min) == df2['lifeExp']
df2[idx]


# So, Turkey had the lowest life expectancy in Europe according to the example dataset.
# Finally, a quick plot of the results with Pandas-only way (i.e. we shall not use `plotly` module).

# In[32]:


ax = df2[idx].plot.bar(x='country', y='lifeExp', rot=0)

