# #stage 1: builder

# FROM golang:1.26.1-alpine AS builder

# WORKDIR /app

# COPY app/ .

# COPY go.mod .

# RUN go build -o server .

# #stage 2: runtime

# FROM scratch

# COPY --from=builder /app/server /server

# # EXPOSE 80

# USER USER 65534:65534

# ENTRYPOINT ["/server"]

FROM golang:1.26.1-alpine AS builder

WORKDIR /app

COPY app/ ./app
COPY go.mod ./

RUN go build -o server ./app


FROM alpine:3.20

WORKDIR /

COPY --from=builder /app/server /server

# 🔥 THIS IS THE FIX ECS NEEDS
RUN echo "app:x:65534:65534:app:/:" > /etc/passwd

USER 65534:65534

EXPOSE 80

ENTRYPOINT ["/server"]