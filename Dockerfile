# Use golang:alpine as base image
FROM golang:alpine

# Set the working directory
WORKDIR /app

# Copy the source code to the working directory
COPY . /app

# Build the Go app
RUN go build -o main .

# Install curl
RUN apk update && apk add --no-cache curl

# Install bash
RUN apk update && apk add --no-cache bash

# Expose port 8080 for the application to listen on
EXPOSE 8080

# Run the Go app when the container starts
CMD ["./main"]