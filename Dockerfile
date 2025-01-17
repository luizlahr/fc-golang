FROM golang:alpine AS builder

WORKDIR /src

COPY . .

RUN go build -ldflags '-s -w' main.go

FROM scratch

WORKDIR /

COPY --from=builder /src /

CMD ["./main"]