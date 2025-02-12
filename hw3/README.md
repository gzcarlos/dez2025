# Homework #2

### Setup 

1. Run kestra compose file in this folder.

```bash
docker compose up -d
```

Other steps 

1. Created a bucket in Google Cloud Storage.
2. Downloaded each parquet file from `https://www.nyc.gov/site/tlc/about/tlc-trip-record-data.page` for 2024 from January to June. 
3. Uploaded all the files (each file is a month of 2024) to the newly created bucket.

Create an external table using the Yellow Taxi Trip Records Data for 2024.

4. On Google Cloud BigQuery `Create a SQL query`.
5. Create the external table using this statement;


### Run this queries to get the real results

```sql
-- Q1
CREATE OR REPLACE EXTERNAL TABLE `dez-2025-450000.zoomcamp.yellow_tripdata_2024_external`
OPTIONS(
  format = 'PARQUET',
  uris = ['gs://dez-2025-gzcarlos-bucket/yellow_tripdata_2024-*.parquet']
);

drop table dez-2025-450000.zoomcamp.yellow_tripdata_partitioned_real
;


CREATE OR REPLACE TABLE dez-2025-450000.zoomcamp.yellow_tripdata_partitioned
AS 
select * from dez-2025-450000.zoomcamp.yellow_tripdata_2024_external
;

-- Q6
CREATE OR REPLACE TABLE dez-2025-450000.zoomcamp.yellow_tripdata_partitioned_real
PARTITION BY
  DATE(tpep_dropoff_datetime ) AS 
select * from dez-2025-450000.zoomcamp.yellow_tripdata_2024_external
;

-- Q2
select distinct PULocationID
from dez-2025-450000.zoomcamp.yellow_tripdata_partitioned
;

select distinct PULocationID
from dez-2025-450000.zoomcamp.yellow_tripdata_2024_external
;

-- Q3
select PULocationID 
from dez-2025-450000.zoomcamp.yellow_tripdata_partitioned
;

select PULocationID, DOLocationID 
from dez-2025-450000.zoomcamp.yellow_tripdata_partitioned
;

-- Q4
select count(*) from dez-2025-450000.zoomcamp.yellow_tripdata_2024_external
where fare_amount = 0
;

-- Q6
select distinct vendorid
from dez-2025-450000.zoomcamp.yellow_tripdata_partitioned
where tpep_dropoff_datetime  between '2024-03-01' and '2024-03-16' 
;

select distinct vendorid
from dez-2025-450000.zoomcamp.yellow_tripdata_partitioned_real
where tpep_dropoff_datetime  between '2024-03-01' and '2024-03-16' 
;

```