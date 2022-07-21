FROM golang:alpine3.15 as builder

WORKDIR /usr/src/app

COPY . .

RUN go build -o fullcycle ./fullcycle.go

FROM scratch

WORKDIR /usr/src/app

COPY --from=builder /usr/src/app/fullcycle .

ENTRYPOINT ["./fullcycle"]
