tests := ./...

.PHONY: all
all: fmt test

.PHONY: fmt
fmt:
	  go fmt ./...

.PHONY: deps
deps:
	  go get ./...

.PHONY: test-deps
test-deps: deps
	  go get -t ./...

.PHONY: test
test: test-unit

.PHONY: test-unit
test-unit: test-deps
	  @set -a; go test $(tests) -run 'Unit'
