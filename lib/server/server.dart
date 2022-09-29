import 'package:grpc/grpc.dart';
import 'package:request_viewer/server/request_server.dart';

class MainServer{
  static Future<void> serve()async{
        final server = Server(
      [
        RequestServer()
      ],
      const <Interceptor>[],
      CodecRegistry(codecs: const [
        GzipCodec(),
        IdentityCodec(),
      ]),
    );
    print('Server initialized');
    return server.serve(
      address: 'localhost',
      port: 50051);
  }
}