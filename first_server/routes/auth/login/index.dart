import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:first_server/models/user.dart';

Future<Response> onRequest(RequestContext context) async {
  final request = context.request;

  if (request.method == HttpMethod.post) {
    return _handlePostRequest(context);
  }
  return Response.json(
    statusCode: 405,
    body: {
      'status': false,
      'message': 'Request not allowed',
    },
  );
}

Future<Response> _handlePostRequest(RequestContext ctx) async {
  try {
    final request = ctx.request;

    //! Read JSON body from request
    final body = await request.json();

    //! Convert JSON data to user model
    final user = User.fromJson(body as Map<String, dynamic>);
    return Response.json(
      body: {'status': true, 'message': user.toJson()},
    );
  } catch (e) {
    return Response.json(
      statusCode: HttpStatus.badRequest,
      body: {
        'status': false,
        'message': e.toString(),
      },
    );
  }
}
