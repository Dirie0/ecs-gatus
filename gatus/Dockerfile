# Build the go application into a binary
FROM golang:alpine AS builder
# RUN apk --update add ca-certificates
WORKDIR /app
COPY . ./
RUN go mod tidy -diff
RUN CGO_ENABLED=0 GOOS=linux go build -o executable .


# Run the binary on an empty container
FROM scratch
COPY --from=builder /app/executable .
COPY --from=builder /app/config.yaml ./config/config.yaml
# COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt
EXPOSE 8080
ENTRYPOINT ["/executable"]



