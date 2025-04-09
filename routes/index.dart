import 'package:dart_frog/dart_frog.dart';

Response onRequest(RequestContext context) {
  return Response.json(body: {'message': 'Welcome to mi_negocio_backend API!'});
}
