# docker volume vs mount 
Docker volumes are a native storage mechanism provided by Docker, designed explicitly for storing data within containers. They are managed by the Docker daemon and provide better performance than bind mounts. 
Bind mounts, on the other hand, rely on the host's file system to store data.


docker volume create volumeName
docker volume ls
docker volume ispect volumeName/id - to get the details of driver & mountpath
docker volume rm
docker volume prune - to delete all unused volumes

