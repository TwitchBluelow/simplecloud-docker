FROM amazoncorretto:21-alpine-jdk
WORKDIR /app

COPY entrypoint.sh /app/

# Fetching dependencies
RUN apk add unzip screen dos2unix wget

RUN wget https://github.com/theSimpleCloud/SimpleCloud/releases/download/v2.7.1/SimpleCloud-v2.7.1.zip && \
    unzip SimpleCloud-v2.7.1.zip && \
    rm SimpleCloud-v2.7.1.zip start.bat && \
    chmod +x start.sh && \
    chmod +x entrypoint.sh && \
    dos2unix entrypoint.sh

ENTRYPOINT [ "./entrypoint.sh" ]
