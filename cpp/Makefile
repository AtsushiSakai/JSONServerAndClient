
docker_build_client:
	docker build -t cpp_json_client -f json_client/Dockerfile .

docker_run_client:
	docker run -it -e SERVER_IP=192.168.86.29 cpp_json_client

docker_build_server:
	docker build -t cpp_json_server -f json_server/Dockerfile .

docker_run_server:
	docker run -it -e SERVER_IP=0.0.0.0 -p 8000:8000 cpp_json_server
