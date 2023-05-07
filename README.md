# Tip command
```bash
# Init docker vm
docker machine init
docker machine start

# Build image
docker build -t localhost/centos .
docker exec -it localhost/centos bash

# Push image to ACR
docker tag centos auoplatform.azurecr.io/centos:latest
docker images
docker push auoplatform.azurecr.io/centos:latest

# Run image
docker run -it --name centos localhost/centos

# Diag
docker logs centos

# Delete container
docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)
```