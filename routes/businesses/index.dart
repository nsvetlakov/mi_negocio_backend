import 'package:dart_frog/dart_frog.dart';
import 'dart:convert';
import '../../lib/services/business_service.dart';

Future<Response> onRequest(RequestContext context) async {
  if (context.request.method == HttpMethod.get) {
    final businesses = BusinessService.getAll();
    return Response.json(body: businesses.map((b) => b.toJson()).toList());
  } else if (context.request.method == HttpMethod.post) {
    final body = await context.request.body();
    final data = jsonDecode(body);
    final newBusiness = BusinessService.create(data);
    return Response.json(body: newBusiness.toJson());
  }
  return Response(statusCode: 405);
}
