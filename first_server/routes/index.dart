import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

Response onRequest(RequestContext context) {
  final req = context.request;
  if (req.method == HttpMethod.get) {
    final greeting = context.read<String>();
    return Response(body: greeting);
  }
  return Response(body: 'Invalid request', statusCode: HttpStatus.badRequest);
}
