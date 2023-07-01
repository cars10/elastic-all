#!/bin/bash

curl -X POST http://localhost:9506/_bulk -H 'Content-Type: application/json' --data-binary "@./datasets/omdb.json"
curl -X POST http://localhost:9506/_bulk -H 'Content-Type: application/json' --data-binary "@./datasets/shakespeare.json"

curl -X POST http://localhost:9507/_bulk -H 'Content-Type: application/json' --data-binary "@./datasets/omdb.json"
curl -X POST http://localhost:9507/_bulk -H 'Content-Type: application/json' --data-binary "@./datasets/shakespeare.json"

curl -k -X POST https://elastic:elastic@localhost:9508/_bulk -H 'Content-Type: application/json' --data-binary "@./datasets/omdb-8.json"
curl -k -X POST https://elastic:elastic@localhost:9508/_bulk -H 'Content-Type: application/json' --data-binary "@./datasets/shakespeare-8.json"
