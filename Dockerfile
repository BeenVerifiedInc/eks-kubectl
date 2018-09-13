FROM alpine:3.5
RUN apk --no-cache update && \
    apk --no-cache add ca-certificates curl && \
    rm -rf /var/cache/apk/*
RUN curl -L https://amazon-eks.s3-us-west-2.amazonaws.com/1.10.3/2018-07-26/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl
RUN curl -L https://amazon-eks.s3-us-west-2.amazonaws.com/1.10.3/2018-07-26/bin/linux/amd64/aws-iam-authenticator -o /usr/local/bin/aws-iam-authenticator \
  && chmod +x /usr/local/bin/aws-iam-authenticator
ENTRYPOINT ["/usr/local/bin/kubectl"]
