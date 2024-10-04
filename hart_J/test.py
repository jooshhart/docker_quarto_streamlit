import polars as pl

df = pl.DataFrame({"lst": [[1, 2, 3], [4, 5, 6]], "ind": [1, 2]})

df = (
    df.with_row_index()
    .with_columns(
        pl.col("lst").explode().gather(1).over(pl.col("index")).alias("list[ind]")
    )
    .drop("index")
)

print(df)