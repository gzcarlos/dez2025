# Homework #1 

## Q1

```bash
docker run --entrypoint bash -it python:3.12.8
```

## Q2

The hostname is: `postgress`

Since the port ins mapped from `5432` to `5433` the final port is `5433`

## Q3 

Download data

```bash
wget https://github.com/DataTalksClub/nyc-tlc-data/releases/download/green/green_tripdata_2019-10.csv.gz
wget https://github.com/DataTalksClub/nyc-tlc-data/releases/download/misc/taxi_zone_lookup.csv
```

 Create virtual environment and activate it to install requirements

 ```bash
 python -m venv .venv
 # using linux
 source .venv/bin/activate
 pip install -r requirements.txt
 ```

