# Tip command
```bash
# Init docker vm
docker machine init
docker machine start

# Build image
docker build -t centos .
docker build -t centos . --no-cache
docker build -t auoplatform.azurecr.io/centos . --no-cache
docker exec -it centos bash

# Push image to ACR
docker tag centos auoplatform.azurecr.io/centos:latest
docker images
docker push auoplatform.azurecr.io/centos:latest

# Run image
docker run -it --name centos localhost/centos

# Diag
docker logs centos

# Delete container
docker stop centos
docker rm centos
```