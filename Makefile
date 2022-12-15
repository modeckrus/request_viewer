.PHONY: proto build

proto:
	protoc --dart_out=grpc:request_sender/request_model/lib/src/generated -Iprotos protos/*.proto
build:
	flutter pub run build_runner build --delete-conflicting-outputs 