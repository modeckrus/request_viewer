.PHONY: proto

proto:
	protoc --dart_out=grpc:request_sender/request_model/lib/src/generated -Iprotos protos/*.proto