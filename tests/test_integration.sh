#!/bin/bash

echo "Starting integration tests..."

BASE_URL="http://localhost:8000"

echo "Testing /health endpoint"
curl -f $BASE_URL/health || exit 1

echo "Testing POST /services"
curl -X POST $BASE_URL/services \
-H "Content-Type: application/json" \
-d '{"name":"google","url":"https://google.com"}' || exit 1

echo "Testing GET /services"
curl -f $BASE_URL/services || exit 1

echo "Testing POST /incidents"
curl -X POST $BASE_URL/incidents \
-H "Content-Type: application/json" \
-d '{"service_name":"google","title":"API Down","severity":"major"}' || exit 1

echo "Testing GET /incidents"
curl -f $BASE_URL/incidents || exit 1

echo "All integration tests passed!"