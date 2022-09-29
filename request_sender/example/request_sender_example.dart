import 'package:dio/dio.dart';
import 'package:request_sender/request_sender.dart';

void main() async {
  Dio dio = Dio();
  dio.interceptors.add(RequestSenderInterceptor());
  await dio.get('https://google.com');
}
