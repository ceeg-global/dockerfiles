FROM python:3.9.0

RUN mkdir /app
WORKDIR /app

add app.sh /
RUN chmod +x /app.sh

ENTRYPOINT ["/app.sh"]