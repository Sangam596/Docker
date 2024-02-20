# Dockerfile reference
Docker can build images automatically by reading the instructions from a Dockerfile.

The Dockerfile supports the following instructions:

Instruction	             Description                                                    Usage
ADD	                Add local or remote files and directories.                  ADD mypack.tgz app/
ARG	                Use build-time variables.                              ARG  CODE_VERSION=latest
 ARG instructions that occur before the first FROM.                        FROM base:${CODE_VERSION}
CMD	                Specify default commands.                                   CMD echo "world"
COPY	    	    Copy files and directories.                                 COPY . .
ENTRYPOINT	        Specify default executable.                                 ENTRYPOINT echo "hello"
ENV		            Set environment variables.                                  ENV abc=hello
EXPOSE		        Describe which ports your application is listening on.      EXPOSE 80/tcp 80/udp
FROM		        Create a new build stage from a base image.                 FROM ubuntu:latest
HEALTHCHECK		    Check a container's health on startup.

LABEL		        Add metadata to an image.
    usage - LABEL com.example.label-with-value="foo"
            LABEL version="1.0"
            LABEL description="This text illustrates \
            that label-values can span multiple lines."  

MAINTAINER		    Specify the author of an image.                               MAINTAINER <name>
ONBUILD		        Specify instructions for when the image is used in a build.
RUN		            Execute build commands.                                     RUN apt update
SHELL		        Set the default shell of an image.                      SHELL ["executable","params"]
STOPSIGNAL		    Specify the system call signal for exiting a container.
USER		        Set user and group ID.                                       USER UID[:GID]
VOLUME		        Create volume mounts.                                        VOLUME /myvol
WORKDIR	            Change working directory.                                    WORKDIR /app



# Difference between ADD and COPY in dockerfile
COPY 
is a docker file command that copies files from a local source location to a destination in the Docker container. It copies the zip or tar file without unzipping 
ADD 
command is used to copy files/directories into a Docker image
It copies the zip or tar file by unzipping/extracting files/directories

# Difference between CMD and ENTRYPOINT in dockerfile
ENTRYPOINT is the process that's executed inside the container. 
CMD is the default set of arguments that are supplied to the ENTRYPOINT process

# Difference between CMD and RUN in dockerfile
RUN is used to execute commands during the build process of a Docker image
CMD is used to specify the default command to run when a Docker container is started from the image


Docker file is automatically picked if the name of file is name "Dockerfile"
Otherwise while building the image it is needed to mention the file name with -f flag 
docker build . (dot refers to the current directory)
docker build -f otherDockerfileName

