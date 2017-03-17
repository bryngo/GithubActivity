#/bin/bash

if (("$#" != "1"))
then
	echo "Error: exactly one argument expected"
	exit 0
fi

docker images > /tmp/img$$

# Add w flag for exact matching
if grep -q -w $1 /tmp/img$$
then
    docker ps -a > /tmp/ctr$$

		# swap to web2
    if grep --quiet web1 /tmp/ctr$$
    then
        docker run -d --network ecs189_default --name web2 $1
        docker exec ecs189_proxy_1 /bin/bash /bin/swap2.sh
        docker rm -f `docker ps -a | grep web1 | sed -e 's: .*$::'`

		# swap to web1
    elif grep --quiet web2 /tmp/ctr$$
    then
        docker run -d --network ecs189_default --name web1 $1
        docker exec ecs189_proxy_1 /bin/bash /bin/swap1.sh
        docker rm -f `docker ps -a | grep web2 | sed -e 's: .*$::'`
    fi

else
	echo "Error: image $1 not found"
	exit 0
fi
