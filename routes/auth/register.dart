import 'package:dart_frog/dart_frog.dart';
import 'dart:convert';
import '../../lib/services/auth_service.dart';

Future<Response> onRequest(RequestContext context) async {
  if (context.request.method != HttpMethod.post) {
    return Response(statusCode: 405);
  }
  final body = await context.request.body();
  final data = jsonDecode(body);
  final user = AuthService.register(data['email'], data['password']);
  return Response.json(body: user.toJson());
}
