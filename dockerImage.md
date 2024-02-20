
# list images
docker images or docker image ls
docker image history imageId or ImageName

# 3 ways to Delete images
docker rmi containerId or
docker image rm containerId or 
docker image remove containerId

# remove all unused images
docker rmi $(docker images -aq)
 #docker image prune - dont use this at all

# ispect the image
docker image inspect imageId

# docker image save vs load
docker image save imageID/imageName > file.tar
docker image save myubuntu > ubuntu.tar

docker image load < ubuntu.tar

# docker export(conatiner)/import(image) vs image save/load(image)
Both will gives tar file but 
image save will export all the layes with all tags
export will export only specific container it will not take the export of volumes mounts
image import & image load - both will import the image from STDIN

$ docker --help | grep -E "(export|import|load|save)"
  export      Export a container\'s filesystem as a tar archive
  import      Import the contents from a tarball to create a filesystem image
  load        Load an image from a tar archive or STDIN
  save        Save one or more images to a tar archive (streamed to STDOUT by default)




