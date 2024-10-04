These folders have the same data in varied formats and configurations. You can use your tools with the `csv` and `parquet_derived` folders. If you use the `parquet_derived` folder, you will need the [arrow](https://arrow.apache.org/docs/r/index.html) package in R or the [PyArrow](https://arrow.apache.org/docs/python/index.html) package in Python.

The `parquet` folder is where you should focus. You will use [Polars](https://www.pola.rs/) and [PyArrow](https://arrow.apache.org/docs/python/index.html) in Python to tackle the work. The [Polars Guide](https://pola-rs.github.io/polars-book/user-guide/) and [Polars Python API](https://pola-rs.github.io/polars/py-polars/html/reference/) provide support for your journey.

Remember that the Polars API is similar to PySpark and will be productive for our journey into PySpark.  Polars is my tool of preference in Python for _'medium data'_ projects. PySpark is my tool of choice for _'big data'_ projects. Finally, Pandas works for my _'small data'_ projects.

- `csv`: Is the raw format provided by Safegraph.
- `parquet_derived`: Is a derived structure from `csv` with all the nested data exploded into their own respective tables.
- `parquet`: Has a structure very close to the `csv` structure provided by Safegraph and in the format we will have on Databricks.