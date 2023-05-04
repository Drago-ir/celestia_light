# celestia_light
Dockerfile to setup a light node


# Play For Bob transaction
```
docker exec -it $(docker ps -aqf "ancestor=celes_light") pfb.sh
sudo docker exec -it $(sudo docker ps -aqf "ancestor=celes_light") sh

sudo docker exec -it 996909e9be38 sh

sudo docker ps -aqf "ancestor=celes_light"
```