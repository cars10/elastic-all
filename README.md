# elastic-all

This project includes the following containers:

- elasticsearch 9 (2 nodes): `https://localhost:9509` (elastic:elastic) - SSL enabled
- elasticsearch 8 (3 nodes): `https://localhost:9508` (elastic:elastic) - SSL enabled
- elasticsearch 7 (2 nodes): `http://localhost:9507`
- elasticsearch 6 (2 nodes): `http://localhost:9506`
- elasticsearch 5 (1 node): `http://localhost:9505`
- elasticsearch 2 (1 node): `http://localhost:9502`
- elasticsearch 1 (1 node): `http://localhost:9501`
- opensearch 2 (2 nodes): `http://localhost:9602` (admin:admin)

## Usage

### Initial setup

Run `make prepare` to generate SSL certificates for Elasticsearch 8 and 9.

### Start all containers

Run `make start` to start all Elasticsearch containers (versions 9, 8, 7, 6, 5, 2, 1).

### Start specific versions

- `make 9` - Start Elasticsearch 9
- `make 8` - Start Elasticsearch 8
- `make 7` - Start Elasticsearch 7
- `make 6` - Start Elasticsearch 6
- `make 5` - Start Elasticsearch 5
- `make 2` - Start Elasticsearch 2
- `make 1` - Start Elasticsearch 1
- `make opensearch` - Start OpenSearch 2

### Data seeding

Run `make seed` to populate all clusters with sample data (OMDB and Shakespeare datasets).

## Notes

- Elasticsearch 8 and 9 use SSL/TLS and require HTTPS connections with the `-k` flag for curl (or proper certificate handling)
- Elasticsearch 7, 6, 5, 2, and 1 use plain HTTP
- Default credentials for Elasticsearch 8 and 9: `elastic:elastic` (or value from `ELASTIC_PASSWORD` env var)
- Default credentials for OpenSearch: `admin:admin` (or value from `OPENSEARCH_PASSWORD` env var)
