FROM alpine:3.2
RUN apk --update add openjdk7-jre openssl

RUN mkdir -p /root/dynamo && \
    wget https://s3-us-west-2.amazonaws.com/dynamodb-local/dynamodb_local_latest.tar.gz && \
    tar -xvzf dynamodb_local_latest.tar.gz -C /root/dynamo/ && \
    rm dynamodb_local_latest.tar.gz

EXPOSE 8000

WORKDIR /root/dynamo

ENTRYPOINT ["java", "-Djava.library.path=./DynamoDBLocal_lib", "-jar","DynamoDBLocal.jar","-sharedDb"]