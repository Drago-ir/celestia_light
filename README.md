# celestia_light
Dockerfile to setup a light node

# Node Id
sudo docker exec -it $(sudo docker ps -aqf "ancestor=celes_light") node_id.sh

# Play For Bob transaction
Don´t forget to get test token
```
sudo docker exec -it $(sudo docker ps -aqf "ancestor=celes_light") pfb.sh
sudo docker exec -it $(sudo docker ps -aqf "ancestor=celes_light") pfb.sh <namespace_id> <data>
```

