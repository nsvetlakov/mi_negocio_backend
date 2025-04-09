import 'dart:io';
import 'package:dart_frog/dart_frog.dart';

Future<HttpServer> run(Handler handler, InternetAddress ip, int port) async {
  return HttpServer.bind(ip, port);
}
