.PHONY: start-project stop-project rerun-project test test-api

start-project:
	docker compose -p mlops up -d --build --wait

stop-project:
	docker compose -p mlops down

rerun-project: stop-project start-project

test: stop-project start-project
	bash tests/run_tests.sh

test-api:
	curl -X POST "https://localhost/predict" \
	    -H "Content-Type: application/json" \
	    -d '{"sentence": "Oh yeah, that was soooo cool!"}' \
	    --user admin:admin \
	    --cacert ./deployments/nginx/certs/nginx.crt
