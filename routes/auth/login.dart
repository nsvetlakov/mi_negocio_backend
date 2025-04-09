import 'package:dart_frog/dart_frog.dart';
import 'dart:convert';
import '../../lib/services/auth_service.dart';

Future<Response> onRequest(RequestContext context) async {
  if (context.request.method != HttpMethod.post) {
    return Response(statusCode: 405);
  }
  final body = await context.request.body();
  final data = jsonDecode(body);
  final token = AuthService.login(data['email'], data['password']);
  return token != null ? Response.json(body: {'token': token}) : Response(statusCode: 401);
}
