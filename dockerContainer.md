# Docker architecture is important


docker -h Information of docker commands
docker -h | less
docker ps or docker container ls - list running docker containers
docker ps -1 or docker container ls -l - list all docker containers
docker run ubuntu - pull & run the ubuntu container from docker hub, this will pull, run and stop the ubuntu container immediately
docker run ubuntu sleep 30 - pull & run the ubuntu container from docker hub, this will pull, run and stop the ubuntu container after 30 seconds
docker run ubuntu cat /etc/os-release - create & run the ubuntu container from docker hub & run the command inside the container


docker run nginx - now the terminal is in the container terminal & you can't perform any other operation
docker container rm d6dd11b87513
you cann't remove the running container in order to remove that first stop it 
docker container stop d6 - no need to give all characters of container id you can give the starting chars which are unique
docker container rm d6d or docker rm

docker container rm 9a44 7ae - you can give multiple container id's to delete multiple container

If you want run the container in bachground, you can run it in dettached mode using -d
docker container start id - to start the non running container
docker container stop id - to stop the running container
docker container restart id - restart the container

docker container run -d ubuntu sleep 30 - run the container in detached or background mode

Interactive mode - run the container and run commands inside the container 
docker container run -it ubuntu /bin/bash
whoami -Linux
apt-get update
apt install tree 

what if you are already inside the container terminal - ctrl+p and ctrl+q will make it runs in background

Delete all the unused/stopped containers at once
Fetch all the unused container id's- docker ps -aq
Pass the o/p of above command to - docker container rm
docker rm $(docker ps -aq)

# Useful Commands for containers
docker -h or docker --help
docker ps -h
docker rm -h
docker ps
docker ps -a
docker ps -aq

docker attach containerid
docker -d containerid

docker rm
docker rm $(docker ps -aq)

docker stop containerid
docker kill containerid
docker start containerid
docker wait containerid
docker pause containerid
docker unpause containerid

docker container run -it ubuntu /bin/bash
hoami -Linux
apt-get update
apt install tree 
tree

docker restart containerid
docker rename containerid newName
docker inspect containerid 
docker inspect containerid | less - for more readable format 

docker logs containerid 
docker logs containerid -n 5 -> 5 is n0. of lines to print

docker top containerid - process and child processes of running containers

docker exec -it containerid /bin/bash

ps -aux - process running on docker
docker starts - for cpu & memory usage

# Difference between Docker run, Docker start and Docker create
Docker create command creates a fresh new container from a docker image. However, it doesn’t run it immediately.
Docker start command will start any stopped container. If you used docker create command to create a container, you can start it with this command.
Docker run command is a combination of create and start as it creates a new container and starts it immediately. In fact, the docker run command can even pull an image from Docker Hub if it doesn’t find the mentioned image on your system.

netstat -n - shows ports occupied on the system

docker prune -f :- to delete all the unused containers without asking for confirmation

docker cp source containerid:destination


# Lets say you created a container and changed as follows: & you want take a copy or transfer it to another person
    docker container run -it ubuntu /bin/bash
    hoami -Linux
    apt-get update
    apt install tree 
    apt install git
    tree
    docker export containedid > myubuntu.tar or docker export containedid -o  myubuntu.tar
    docker export containedid > newubuntu.tgz or docker export containedid -o  newubuntu.tgz
    you will get this tar file current directory


    and later you can import it as image
    docker image import .\myubuntu.tar myubuntu(image name)
    docker run -it myubuntu /bin/bash
    tree
    git --version

# if you want to create a new image of runing container
docker commit  --author "sangam bgk" -m "Creating a new image from container" containedId imagename/repository:TAG 
docker commit  --author "sangam bgk" -m "Creating a new image from container" 2fd4346f2826 myubuntu 
then you can create container from that image - 
docker run -it myubuntu /bin/bash
tree
git --version
If you push it to docker hub registry then anyone can access/pull this image 

# How to push new image to docker hub
docker login -u dockerhub sangambgk 
enter password or create personal access token from docker hub
docker commit  --author "sangam bgk" -m "Creating a new image from container" containedId myubuntu(imageName)
docker image tag myubuntu sangambgk/myubuntu:tag
docker image push imageName hub.docker.com/sangambgk/imageName:tag - hub.docker.com will be default if it is docker otherwise you need to use it explicitly
docker image push sangambgk/myubuntu:v1


commit >> image tag >> image push

