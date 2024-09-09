BINARY_NAME=simple-fiber-api
MAIN_FILE_PATH=./cmd/api/main.go
BINARIES_PATH=./bin

all: build-mac build-linux build-windows
test: test-unit test-integration test-e2e

test-unit:
	go test -v ./internal/tests/unit/

test-e2e:
	go test -v ./internal/tests/e2e/

test-integration:
	go test -v ./internal/tests/integration/

build:
	go build -o ${BINARIES_PATH}/${BINARY_NAME} ${MAIN_FILE_PATH}

build-mac:
	GOOS=darwin GOARCH=amd64 go build -o ${BINARIES_PATH}/${BINARY_NAME}-mac ${MAIN_FILE_PATH}

build-linux:
	GOOS=linux GOARCH=amd64 go build -o ${BINARIES_PATH}/${BINARY_NAME}-linux ${MAIN_FILE_PATH}

build-windows:
	CC=x86_64-w64-mingw32-gcc CXX=x86_64-w64-mingw32-g++ GOOS=windows GOARCH=amd64 CGO_ENABLED=1 go build -o ${BINARIES_PATH}/${BINARY_NAME}-windows.exe ${MAIN_FILE_PATH}

run: build
	./${BINARIES_PATH}/${BINARY_NAME}

clean:
	go clean
	rm -f ${BINARIES_PATH}/${BINARY_NAME}
