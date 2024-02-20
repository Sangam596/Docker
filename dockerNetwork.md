# Networking overview
Container networking refers to the ability for containers to connect to and communicate with each other
Containers have networking enabled by default - bridge netwrok

# Drivers
The following network drivers are available by default, and provide core networking functionality:

Driver	       Description
bridge	    The default network driver.
host	    Remove network isolation between the container and the Docker host.
none	    Completely isolate a container from the host and other containers.
overlay	    Overlay networks connect multiple Docker daemons together.
ipvlan	    IPvlan networks provide full control over both IPv4 and IPv6 addressing.
macvlan	    Assign a MAC address to a container.


# The following example creates a network using the bridge network driver and running a container in the created network:
docker network create -d bridge my-net
docker run --network=my-net -itd --name=container3 busybox

# Published ports
By default, when you create or run a container using docker create or docker run, the container doesn't expose any of its ports to the outside world. Use the --publish or -p flag to make a port available to services outside of Docker. 

Flag value	                            Description
-p 8080:80	                    Map port 8080 on the Docker host to TCP port 80 in the container.
-p 192.168.1.100:8080:80	    Map port 8080 on the Docker host IP 192.168.1.100 to TCP port 80 in the container.
-p 8080:80/udp	                Map port 8080 on the Docker host to UDP port 80 in the container.
-p 8080:80/tcp -p 8080:80/udp	Map TCP port 8080 on the Docker host to TCP port 80 in the container, and map UDP port 8080 on the Docker host to UDP port 80 in the container.

docker run -p 127.0.0.1:8080:80 nginx

# DNS services
Containers use the same DNS servers as the host by default, but you can override this with --dns.

By default, containers inherit the DNS settings as defined in the /etc/resolv.conf configuration file. Containers that attach to the default bridge network receive a copy of this file. Containers that attach to a custom network use Docker's embedded DNS server. 

and custom bridge network can resolve the dns by default If this functionality is required delete the bridge network and crete a new one using bridge driver


# User-defined networks - bridge
You can create custom, user-defined networks, and connect multiple containers to the same network. Once connected to a user-defined network, containers can communicate with each other using container IP addresses or container names.

User-defined bridges provide better isolation.
Containers can be attached and detached from user-defined networks on the fly.
Each user-defined network creates a configurable bridge.

# host user defined network
If you use the host network mode for a container, that container's network stack isn't isolated from the Docker host (the container shares the host's networking namespace), and

the container doesn't get its own IP-address allocated. For instance, if you run a container which binds to port 80 and you use host networking, the container's application is available on port 80 on the host's IP address.

# Overlay User defined network
You can create user-defined overlay networks using docker network create
docker network create -d overlay my-overlay