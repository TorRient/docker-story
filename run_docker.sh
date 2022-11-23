# Build docker image
docker build -t service_test .

# Run docker Image
docker run -it --rm \
    -p 8080:8080 \
    -v $PWD/logs/:/usr/local/tomcat/logs/ \
    service_test

