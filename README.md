# Tip command
```bash
# Init docker vm
docker machine init
docker machine start

# Build image and run container
docker build -t localhost/centos .
docker run -it --name centos localhost/centos
docker exec -it localhost/centos bash

# Push image to ACR
docker tag localhost/centos auoplatform.azurecr.io/centos:latest
docker push auoplatform.azurecr.io/centos:latest

# Diag
docker logs centos

# Delete container
docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)
```