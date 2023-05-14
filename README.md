# Tip command
```bash
# Init docker vm
docker machine init
docker machine start

# Build image and run container
docker build -t centos:7.9.2009 .
docker run -it --name centos centos:7.9.2009
docker exec -it centos bash

# Push image to ACR
docker tag centos:7.9.2009 auoplatform.azurecr.io/centos:7.9.2009
docker push auoplatform.azurecr.io/centos:7.9.2009

# Diag
docker logs centos

# Delete container
docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)
```