FROM golang:1.22.2-alpine3.19 AS builder

WORKDIR /usr/src/app

COPY ./index.go .

RUN go build index.go

FROM scratch

COPY --from=builder /usr/src/app/index index

CMD [ "./index" ]

