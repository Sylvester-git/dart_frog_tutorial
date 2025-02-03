import 'dart:async';
import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:todos_data_source/todos_data_source.dart';

FutureOr<Response> onRequest(RequestContext context) async {
  switch (context.request.method) {
    case HttpMethod.get:
      return _get(context);
    case HttpMethod.post:
      return _post(context);
    case HttpMethod.delete:
    case HttpMethod.patch:
    case HttpMethod.head:
    case HttpMethod.put:
    case HttpMethod.options:
      return Response.json(
        statusCode: HttpStatus.methodNotAllowed,
        body: {'status': false, 'message': 'Method Not Allowed'},
      );
  }
}

Future<Response> _get(RequestContext ctx) async {
  final datasource = ctx.read<TodosDataSource>();
  final todos = await datasource.readAll();
  return Response.json(
    body: {
      'status': true,
      'message': 'Data fetched',
      'data': todos,
    },
  );
}

Future<Response> _post(RequestContext ctx) async {
  final dataSource = ctx.read<TodosDataSource>();
  final data = await ctx.request.json() as Map<String, dynamic>;
  final todo = Todo.fromJson(data);

  return Response.json(
    statusCode: HttpStatus.created,
    body: {
      'status': true,
      'message': 'Created successfully',
      'data': await dataSource.create(todo),
    },
  );
}
