# stage 1: builder
FROM golang:1.26.1-alpine AS builder

WORKDIR /app
COPY app/ .
COPY go.mod .
RUN go build -o server .


RUN echo "nobody:x:65534:65534:nobody:/:" > /etc/passwd


# stage 2: runtime
FROM scratch

COPY --from=builder /app/server /server


COPY --from=builder /etc/passwd /etc/passwd

EXPOSE 80


USER 65534:65534

ENTRYPOINT ["/server"]