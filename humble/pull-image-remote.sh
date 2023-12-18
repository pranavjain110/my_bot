branch_name="master"
docker pull ghcr.io/pranavjain110/articulated_robot/humble-image-pc/${branch_name}:latest
docker tag ghcr.io/pranavjain110/articulated_robot/humble-image-pc/${branch_name}:latest humble-image-pc

DANGLING_IMAGES=$(docker images -f "dangling=true" -q)
if [[ -n "$DANGLING_IMAGES" ]]; then
	echo "Remove dangling images"
    docker rmi -f $DANGLING_IMAGES || { echo "Error: Failed to remove dangling images"; exit 1; }
fi