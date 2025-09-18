# %% [markdown]
# ## k-menas clustering

# %%


# %%
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt


# %%
df=pd.read_csv('live.csv')
df.head()
df.info()
df.isnull().sum()

# %%
df.describe()
df.drop(['Column1','Column2','Column3','Column4'],axis=1,inplace=True)

# %%
df.isnull().sum()
# df.shape

# %%
df['status_type'].unique()

# %%
len(df['status_type'].unique())

# %%
df.info()
df.dropna(inplace=True)
df.shape

# %%
df.duplicated().sum()
df.drop_duplicates(inplace=True)

# %%
x=df
y=df['status_type']


# %%
from sklearn.preprocessing import LabelEncoder
le=LabelEncoder()
x['status_type']=le.fit_transform(x['status_type'])
y=le.transform(y)


# %%
x.info()
x.head()

# %% [markdown]
# 


