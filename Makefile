.PHONY: proto

proto:
	protoc --dart_out=grpc:request_sender/proto/lib/src/generated -Iprotos protos/*.proto