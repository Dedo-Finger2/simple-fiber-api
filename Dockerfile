FROM golang:1.23-alpine

WORKDIR /app

COPY go.* ./
RUN go mod download

COPY . .

RUN go build -o simple-fiber-api ./cmd/api/main.go

CMD ["./simple-fiber-api "]
