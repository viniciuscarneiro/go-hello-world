FROM golang:1.18 as builder

WORKDIR /usr/local/bin/app

COPY . .

RUN go build -v

FROM scratch

WORKDIR /usr/local/bin/app

COPY --from=builder /usr/local/bin/app/desafio .

CMD [ "./desafio" ]