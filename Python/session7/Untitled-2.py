# %%
# %% [markdown]
# # K-means Clustering 
# 

# %%
# Importing Libraries
import pandas as pd
import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt

# %%
df=pd.read_csv('Live.csv')

# %%
df.head()

# %%
df.isnull().sum()

# %%
df.shape

# %%
df1=df.drop(columns=['Column1','Column2','Column3','Column4'],axis=1)

# %%
df1.duplicated().sum()

# %%
df_clean=df1.drop_duplicates()

# %%
df_clean.duplicated().count()

# %%
df_clean.describe()

# %%
df_clean.info()

# %%
df_clean['status_id'].unique().__len__()

# %%
df_clean.head()

# %%
df_clean['status_type'].unique().__len__()

# %%
df_clean=df_clean.drop(columns=['status_id','status_published'],axis=1)

# %%
df_clean.head()

# %%
df_clean.info()

# %%
df.shape

# %%
df_clean.duplicated().sum()

# %%
df_clean=df_clean.drop_duplicates()

# %%
x=df_clean
y=df_clean['status_type']

# %%
from sklearn.preprocessing import LabelEncoder
le=LabelEncoder()
x['status_type']= le.fit_transform(x['status_type'])
y=le.transform(y)

# %%
# After fitting the encoder, check the classes_ attribute
print(le.classes_)

# %%
x.info()

# %%
x.head()

# %%
cols=x.columns


# %%
from sklearn.preprocessing import MinMaxScaler
ms = MinMaxScaler()      # 1. Create the scaler object
x = ms.fit_transform(x)  # 2. Fit it to your data AND transform the data in one step

# %%
x

# %%
from sklearn.cluster import KMeans
kmeans= KMeans(n_clusters=2,random_state=0)
kmeans.fit(x)

# %%
x=pd.DataFrame(x,columns=[cols])

# %%
x.head()

# %%
kmeans.inertia_

# %%

# %%
kmeans.cluster_centers_

# %%
labels=kmeans.labels_
correct_labels=sum(y==labels)
print("result: %d out of %d samples were correctly labeled." % (correct_labels, y.size))

# %%
print("accuracy score:{0:0.2f}".format(correct_labels/y.size))

# %%
from sklearn.cluster import KMeans
cs=[]
for i in range(1,11):
    kmeans=KMeans(n_clusters=i,init='k-means++',max_iter=300,n_init=10,random_state=0)
    kmeans.fit(x)
    cs.append(kmeans.inertia_)
plt.plot(range(1,11),cs)
plt.title('The Elbow Method')
plt.xlabel('Number of clusters')
plt.ylabel('CS')
plt.show()


