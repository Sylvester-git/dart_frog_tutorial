import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context) async {
  return switch (context.request.method) {
    HttpMethod.post => _onPost(context),
    _ => Future.value(
        Response.json(
          statusCode: HttpStatus.methodNotAllowed,
          body: {'message': 'Method not allowed'},
        ),
      )
  };
}

Future<Response> _onPost(RequestContext context) async {
  return Response.json(
    body: {
      'user': 'Data',
    },
  );
}
