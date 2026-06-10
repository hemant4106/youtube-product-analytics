import pandas as pd

chunks = []

for chunk in pd.read_csv(
    "data/main_Data.csv",
    chunksize=100000
):
    chunks.append(
        chunk.sample(
            frac=0.01,
            random_state=42
        )
    )

df = pd.concat(chunks)

df.to_csv(
    "data/youtube_random_sample.csv",
    index=False
)

print("Shape:", df.shape)
print("Min Date:", df["event_time"].min())
print("Max Date:", df["event_time"].max())