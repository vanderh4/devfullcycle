FROM golang:alpine as builder
WORKDIR /go/src
COPY src/ .
RUN go build main.go

FROM scratch
WORKDIR /go/src
COPY --from=builder /go/src .

CMD ["./main"]