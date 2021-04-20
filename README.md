# dockerfiles

###
docker build -t ceeg-global/springboot .
docker run --name bus --restart=always -p 8080:8080 -v /data/app:/app  -e JAVA_OPTS="-Duser.timezone=GMT+08 -Xmx512m" -d ceeg-global/springboot
docker restart app && docker attach app

###
docker build -t ceeg-global/python .
docker run --name spider --restart=always -v  /data/app:/app -e PIP_SOURCES="-i https://pypi.tuna.tsinghua.edu.cn/simple/" -d ceeg-global/python --sname=spider --ctype=1 && docker attach spider
docker restart app && docker attach app

###
docker pull redis
docker run --name redis -p 6379:6379 --restart=always -v /data/redis:/data -d redis

###
docker pull rabbitmq:3.8.12-management
docker run --name rabbitmq -p 5672:5672 -p 15672:15672  --restart=always --hostname rabbitmq -e RABBITMQ_DEFAULT_VHOST=rabbitmq -e RABBITMQ_DEFAULT_USER=admin -e RABBITMQ_DEFAULT_PASS=admin -d rabbitmq:3.8.12-management




-------------------------------------------------------
bus
docker run --name bus --restart=always -p 18080:8080 -v /data/bus:/app -e JAVA_OPTS="-Duser.timezone=GMT+08" -d ceeg-global/springboot && docker attach bus 

docker restart bus && docker attach bus

--------
spider
docker run --name spider --restart=always -p 18090:8080 -v /data/spider:/app -e JAVA_OPTS="-Duser.timezone=GMT+08 -Xmx512m" -d ceeg-global/springboot && docker attach spider

docker restart spider && docker attach spider

--------
spider-python
docker run --name spider-python --restart=always -v  /data/spider-python:/app -e PIP_SOURCES="-i https://pypi.tuna.tsinghua.edu.cn/simple/" -d ceeg-global/python --sname=spider --ctype=1 && docker attach spider-python

docker restart spider-python && docker attach spider-python

--------
admin-old
docker run --name admin-old --restart=always -p 8090:8080 -v /data/admin-old:/app -v /data/admin-old-upload:/upload -e JAVA_OPTS="-Duser.timezone=GMT+08 -Xmx512m" -d ceeg-global/springboot && docker attach admin-old 

docker restart admin-old && docker attach admin-old

--------
docker run --name spider-python --restart=always -v  /data/spider-python:/app -e PIP_SOURCES="-i https://pypi.tuna.tsinghua.edu.cn/simple/" -d ceeg-global/python --sname=spider --ctype=0,1,2 && docker attach spider-python

docker restart spider-python && docker attach spider-python
