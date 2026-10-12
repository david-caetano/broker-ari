FROM golang:1.21
WORKDIR /src
RUN apt update; apt install -y protobuf-compiler
RUN go install google.golang.org/protobuf/cmd/protoc-gen-go@v1.28
RUN go install github.com/go-delve/delve/cmd/dlv@v1.21.2
ADD . /src
RUN CGO_ENABLED=0 go build -v -o /usr/local/bin/broker-ari

CMD ["broker-ari"]
