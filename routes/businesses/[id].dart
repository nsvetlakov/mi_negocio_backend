import 'package:dart_frog/dart_frog.dart';
import '../../lib/services/business_service.dart';

Future<Response> onRequest(RequestContext context) async {
  final id = context.request.uri.pathSegments.last;
  final business = BusinessService.getById(id);
  return business != null ? Response.json(body: business.toJson()) : Response(statusCode: 404);
}
