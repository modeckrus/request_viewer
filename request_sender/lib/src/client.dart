import 'dart:io';

import 'package:grpc/grpc.dart';

class MainClient {
  var host = Platform.isAndroid ? '10.0.2.2' : 'localhost';
  late var channel = ClientChannel(
    host,
    port: 50051,
    options: ChannelOptions(
      credentials: ChannelCredentials.insecure(),
      codecRegistry:
          CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]),
    ),
  );
}
