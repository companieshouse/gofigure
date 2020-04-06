TESTS ?= ./...

.EXPORT_ALL_VARIABLES:
GO111MODULE = on

.PHONY: all
all: clean fmt test

.PHONY: fmt
fmt:
	  go fmt ./...

.PHONY: build
build:
	  go build ./...

.PHONY: test
test: test-unit test-integration

.PHONY: test-unit
test-unit:
	  go test $(TESTS) -run 'Unit' -coverprofile=coverage.out

.PHONY: test-integration
test-integration:
	  go test $(TESTS) -run 'Integration'

.PHONY: clean
clean:
	go mod tidy
