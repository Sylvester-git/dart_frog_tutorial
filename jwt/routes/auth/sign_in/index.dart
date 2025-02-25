import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:jwt/authenticator.dart';

Future<Response> onRequest(RequestContext context) async {
  return switch (context.request.method) {
    HttpMethod.post => _onPost(context),
    _ => Future.value(
        Response(statusCode: HttpStatus.methodNotAllowed),
      ),
  };
}

Future<Response> _onPost(RequestContext context) async {
  final body = await context.request.json() as Map<String, dynamic>;
  final username = body['username'] as String?;
  final password = body['password'] as String?;

  if (username == null || password == null) {
    return Response.json(
      statusCode: HttpStatus.unauthorized,
      body: {'error': 'Invalid credentials'},
    );
  }
  final autheticator = context.read<Authenticator>();
  final user = autheticator.findByUsernameAndPassword(
    username: username,
    password: password,
  );

  if (user == null) {
    return Response.json(
      statusCode: HttpStatus.unauthorized,
      body: {
        'message': 'User not found',
        'user': null,
      },
    );
  } else {
    return Response.json(
      body: {
        'message': 'User found',
        'user': user.name,
      },
    );
  }
}
