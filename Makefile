all: compile build
.PHONY: all

.PHONY: compile
PROTOS = conveyor document
compile:
	##for proto in $(PROTOS); do protoc -I pkg/proto/$$proto/ pkg/proto/$$proto/$$proto.proto --go_out=plugins=grpc:pkg/proto/$$proto; done
	for proto in $(PROTOS); do protoc --go_out=. --go_opt=paths=source_relative \
                                      --go-grpc_out=. --go-grpc_opt=paths=source_relative \
                                      pkg/proto/$$proto/$$proto.proto; done

.PHONY: build
build:
	go build -race -ldflags="-s -w" -o bin/collector cmd/collector/main.go

.PHONY: clean
clean:
	rm -rf ./bin
