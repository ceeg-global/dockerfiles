from openjdk:15

RUN mkdir /app
WORKDIR /app

ENTRYPOINT ["sh", "-c", "java ${JAVA_OPTS} -jar /app/app.jar --server.port=8080 ${0} ${@}"]