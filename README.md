# Create/connect to local DuckDB database

```
./duckdb lit.duckdb
```

# Import CSV files into DuckDB tables:

```
CREATE TABLE lit_deriv AS SELECT * FROM read_csv('lit_deriv.csv', sample_size=-1);
CREATE TABLE lit_footnotes AS SELECT * FROM read_csv('lit_footnotes.csv', sample_size=-1);
CREATE TABLE lit_header AS SELECT * FROM read_csv('lit_header.csv', sample_size=-1);
CREATE TABLE lit_nonderiv AS SELECT * FROM read_csv('lit_nonderiv.csv', sample_size=-1);
CREATE TABLE lit_panel AS SELECT * FROM read_csv('lit_panel.csv', sample_size=-1);
CREATE TABLE lit_reportingowner AS SELECT * FROM read_csv('lit_reportingowner.csv', sample_size=-1);
CREATE TABLE lit_signatures AS SELECT * FROM read_csv('lit_signatures.csv', sample_size=-1);
CREATE TABLE lit_submission AS SELECT * FROM read_csv('lit_submission.csv', sample_size=-1);
```

# Connect to other DBs:

```
SHOW DATABASES;
SELECT * FROM duckdb_extensions();
LOAD mysql;
LOAD postgres;
```

```
CREATE TABLE postgres.lit_panel AS FROM lit.lit_panel;
```
