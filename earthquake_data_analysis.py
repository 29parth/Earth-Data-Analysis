import pandas as pd

df = pd.read_csv('earthquake_data.csv')

df.head()

df.isnull().sum()

df.info()

df.describe()

df.duplicated().sum()

df.columns

df.shape

import matplotlib.pyplot as plt
df.isnull().sum().plot(kind='bar')
plt.title("Missing Values")
plt.show()

df['location'].value_counts().head(10)

df.nlargest(10, 'magnitude')

df['magnitude'].mean()

print(df['magnitude'].max())
print(df['magnitude'].min())

plt.hist(df['magnitude'], bins='auto')
plt.xlabel("magnitude")
plt.ylabel("frequency")
plt.title("earthquake magnitude distribution")
plt.show()

df['location'].value_counts().head(10).plot(kind='bar')
plt.title("Top 10 Earthquake Regions")
plt.xlabel("Region")
plt.ylabel("Count")
plt.show()

df['depth'].describe()

plt.scatter(df['depth'], df['magnitude'])
plt.xlabel("depth")
plt.ylabel("magnitude")
plt.title("depth vs magnitude")
plt.show()

import seaborn as sns

sns.heatmap(df.corr(numeric_only=True), annot=True)
plt.title("Correlation Heatmap")
plt.show()

pip install folium
import folium

m = folium.Map(location=[20,0], zoom_start=2)

for index, row in df.head(100).iterrows():
    folium.CircleMarker(
        location=[row['latitude'], row['longitude']],
        radius=3,
        popup=row['location'],
        color='red'
    ).add_to(m)

m

from sqlalchemy import create_engine

username = "postgres"   
password = "2912%40parth"
host = "localhost"
port = "5432"
database = "earthquake_analysis"

engine = create_engine(f"postgresql+psycopg2://{username}:{password}@{host}:{port}/{database}")

table_name = "earthquake" 
df.to_sql(table_name, engine, if_exists="replace", index=False)

print(f"Data succesfully loaded into table '{table_name}' in database '{database}'.")
