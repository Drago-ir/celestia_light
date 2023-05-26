# Dockerfile to run a celestia_light node for the Blockspace Race
```
  sudo docker build -t <name> <path to Dockerfile>
  sudo run --rm <name>
  ```
  
## Get Node Id
  ```
  sudo docker exec -it $(sudo docker ps -aqf "ancestor=celes_light") node_id.sh
  ```
  ## Play For Bob transaction
  Don't forget to get test token. 
```
sudo docker exec -it $(sudo docker ps -aqf "ancestor=<name>") pfb.sh
```
You can use your own namespace_id and data with the following command

```
sudo docker exec -it $(sudo docker ps -aqf "ancestor=<name>") pfb.sh <namespace_id> <data>
```

## Setup Light Node With Persistent Data
To avoid redowloading the data at every start of the container you should mount a volume to the container.
First create a directory to save the data on your host. You may need to change permission for this folder.
```
sudo chown 10001:10001 <path host_directory>
```
Then run the node.
```
sudo run --rm <name> -v <host_directory>:/home/celestia <name>
```
