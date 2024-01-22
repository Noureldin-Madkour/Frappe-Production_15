#!/bin/bash

docker compose --project-name traefik --env-file ./gitops/traefik.env -f overrides/compose.traefik.yaml -f overrides/compose.traefik-ssl.yaml up -d
docker compose --project-name mariadb --env-file ./gitops/mariadb.env -f overrides/compose.mariadb-shared.yaml up -d
docker compose --project-name erpnext-one --env-file ./gitops/erpnext-one.env -f compose.yaml -f overrides/compose.redis.yaml -f overrides/compose.multi-bench.yaml -f overrides/compose.multi-bench-ssl.yaml config > ./gitops/erpnext-one.yaml
docker compose --project-name erpnext-one -f ./gitops/erpnext-one.yaml up -d
docker compose --project-name erpnext-one exec backend bench new-site one.example.com --no-mariadb-socket --mariadb-root-password changeit --install-app erpnext --admin-password changeit
