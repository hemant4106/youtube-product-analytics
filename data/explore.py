import pandas as pd

df = pd.read_csv("data/youtube_random_sample.csv")

print(df.shape)

print(df["event_type"].value_counts())

print(df["event_time"].min())
print(df["event_time"].max())

print(df["user_id"].nunique())