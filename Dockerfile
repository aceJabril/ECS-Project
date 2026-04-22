#stage 1: builder

FROM golang:1.26.1-alpine AS builder

WORKDIR /app

COPY app/ .

COPY go.mod .

RUN go build -o server .

#stage 2: runtime

FROM scratch

COPY --from=builder /app/server /server

# EXPOSE 80

USER USER 65534:65534

ENTRYPOINT ["/server"]

