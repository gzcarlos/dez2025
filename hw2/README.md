# Homework #2

### Setup 
Copied the `docker-compose.yml` from the example that uses the same compose file for
`kestra` and an additional `postgress` database with `pdAdmin`. All 4 services in one
Docker Compose file.


Also, copied the flows from the folder [flows](https://github.com/DataTalksClub/data-engineering-zoomcamp/tree/main/02-workflow-orchestration/flows) in the week lessons

Next, used the following commands to import the flows into my `kestra` instance at http://localhost:8080:

```
curl -X POST http://localhost:8080/api/v1/flows/import -F fileUpload=@flows/01_getting_started_data_pipeline.yaml
curl -X POST http://localhost:8080/api/v1/flows/import -F fileUpload=@flows/02_postgres_taxi.yaml
curl -X POST http://localhost:8080/api/v1/flows/import -F fileUpload=@flows/02_postgres_taxi_scheduled.yaml
curl -X POST http://localhost:8080/api/v1/flows/import -F fileUpload=@flows/03_postgres_dbt.yaml
curl -X POST http://localhost:8080/api/v1/flows/import -F fileUpload=@flows/04_gcp_kv.yaml
curl -X POST http://localhost:8080/api/v1/flows/import -F fileUpload=@flows/05_gcp_setup.yaml
curl -X POST http://localhost:8080/api/v1/flows/import -F fileUpload=@flows/06_gcp_taxi.yaml
curl -X POST http://localhost:8080/api/v1/flows/import -F fileUpload=@flows/06_gcp_taxi_scheduled.yaml
curl -X POST http://localhost:8080/api/v1/flows/import -F fileUpload=@flows/07_gcp_dbt.yaml
```

After that start configuring the `GCP` or `postgres` connections

## Setup the GCP

Create your project un `GCP` console, and then get the `ID` un set it in the flow `04_gcp_kv.yaml`.
Also create set the Bucket name in the file under the task id with key equals `GCP_BUCKET_NAME`.

To get the `GCP_LOCATION` try to create a bucket in GCP to see the best in price for you.
Mine was `us-east1`.

Also create `Service Account` in your project under the Left Burger Menu in IAM. Service Accoun is one of the options.
Grant it `Storage Admin` and `Bigquery Admin`. Then search back to the `Service Accounts`, select the one you just created.
Look under a tab calles `Permissions` and create a Key in `JSON` file that will be downloaded into a `.json` file.

After that go back to [kestra UI](http://localhost:8080) and in `Namespaces`,  select `zoomcamp` (the one for the flows).
And find a tab names `KV Store` and create a new one with name `GCP_CREDS` and type `JSON`.
Then past all the content of the `.json` file downloaded for the `Service Account` you created previously.

Finnally you can run the flow `05_gcp_setup` which will create all the resources ou need in `GCP` (hopefully).

## Setup the postgres

This is the simplest way to setup a storage for the this flows.

Just need to change the file `postgres` 
- 02_postgres_taxi
- 02_postgres_taxi_scheduled
- 03_postgres_dbt

All this files have near the EOF (End of File) the connection string to be changed.

So, just set the `url` to 
```
jdbc:postgresql://postgres_zoomcamp:5432/postgres-zoomcamp
```