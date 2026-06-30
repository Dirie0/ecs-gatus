# Build stage
FROM golang:1.26-alpine AS builder
RUN apk --no-cache add ca-certificates
WORKDIR /app
COPY . ./
RUN go mod edit -exclude=golang.org/x/crypto@v0.51.0
RUN go mod tidy -diff
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o executable .

RUN addgroup -S appgroup && adduser -S appuser -G appgroup

# Production stage
FROM scratch
COPY --from=builder /etc/passwd /etc/passwd
COPY --from=builder /etc/group /etc/group
COPY --from=builder /app/executable /executable
COPY --from=builder /app/config.yaml /config/config.yaml
COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt
ENV GATUS_CONFIG_PATH=""
ENV GATUS_LOG_LEVEL="INFO"
ENV PORT="8080"
EXPOSE 8080
USER appuser:appgroup
ENTRYPOINT ["/executable"]




