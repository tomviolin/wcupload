
all: build kill run

build:
	#docker build -t wcupload .

kill:
	docker kill wcupload || echo ""
	docker rm wcupload || echo ""

run:
	docker run -d --restart always \
	    -e USERS="wcupload|hc01access|/staging|1001" \
	    -p 30120-30121:20-21 \
	    -p 21000-21010:21000-21010 \
	    --name wcupload \
	    -v /opt/webcam/staging:/staging \
	    delfer/alpine-ftp-server

