# elastic-all

This project includes the following containers:

* elasticsearch 8 (2 nodes): `https://localhost:9208` (elastic:elastic)
* elasticsearch 7 (2 nodes): `http://localhost:9207`
* elasticsearch 6 (2 nodes): `http://localhost:9206`
* elasticsearch 5 (1 node): `http://localhost:9205`
* elasticsearch 2 (1 node): `http://localhost:9202`
* elasticsearch 1 (1 node): `http://localhost:9201`
* minio: `http://localhost:9000`

## Usage
### Initial setup

Run `make prepare`

### Start all containers

Run `make start`


## Snapshots

You can use the included minio to push s3 snapshots from elasticsearch. E.g. for elasticsearch 8:

### Minio setup

1. Open [http://localhost:9000](http://localhost:9000)
2. Login with `minioadmin`:`minioadmin`
2. Create a bucket named `elastic`
3. Create an access key. Save the access_key and the secret_key!

### Snapshot setup

Node 1
1. `docker compose exec es-8-node-1 bin/elasticsearch-keystore add s3.client.default.access_key`
2. Paste the access key
3. `docker compose exec es-8-node-1 bin/elasticsearch-keystore add s3.client.default.secret_key`
4. Paste the secret key

Node 2
1. `docker compose exec es-8-node-2 bin/elasticsearch-keystore add s3.client.default.access_key`
2. Paste the access key
3. `docker compose exec es-8-node-2 bin/elasticsearch-keystore add s3.client.default.secret_key`
4. Paste the secret key


### Create repository

```
PUT _snapshot/es8
{
  "type": "s3",
  "settings": {
    "client": "default",
    "bucket": "elastic",
    "endpoint": "minio:9000",
    "path_style_access": "true",
    "protocol": "http"
  }
}
```