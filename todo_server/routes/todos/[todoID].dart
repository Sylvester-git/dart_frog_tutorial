import 'dart:async';
import 'dart:io';
import 'package:dart_frog/dart_frog.dart';
import 'package:todos_data_source/todos_data_source.dart';

FutureOr<Response> onRequest(RequestContext context, String id) async {
  final dataSource = context.read<TodosDataSource>();
  final todo = await dataSource.read(id);

  if (todo == null) {
    return Response.json(
      statusCode: HttpStatus.notFound,
      body: {
        'status': false,
        'message': 'Not found',
      },
    );
  }
  switch (context.request.method) {
    case HttpMethod.get:
      return _get(context, todo);
    case HttpMethod.put:
      return _put(context, id, todo);
    case HttpMethod.delete:
      return _delete(context, id);
    case HttpMethod.options:
    case HttpMethod.head:
    case HttpMethod.post:
    case HttpMethod.patch:
      return Response.json(
        statusCode: HttpStatus.methodNotAllowed,
        body: {
          'status': false,
          'message': 'Mehtod not alloed',
        },
      );
  }
}

Future<Response> _get(RequestContext ctx, Todo todo) async {
  return Response.json(
    body: {
      'status': true,
      'message': 'Data fecthed',
      'data': todo,
    },
  );
}

Future<Response> _put(RequestContext ctx, String id, Todo todo) async {
  final dataSource = ctx.read<TodosDataSource>();
  final data = await ctx.request.json();

  final updateTodo = Todo.fromJson(data as Map<String, dynamic>);
  final newTodo = await dataSource.update(
    id,
    todo.copyWith(
      title: updateTodo.title,
      description: updateTodo.description,
      isCompleted: updateTodo.isCompleted,
    ),
  );

  return Response.json(
    body: {
      'status': true,
      'message': 'Updated data',
      'data': newTodo,
    },
  );
}

Future<Response> _delete(RequestContext ctx, String id) async {
  final dataSource = ctx.read<TodosDataSource>();
  await dataSource.delete(id);
  final newTodo = await dataSource.readAll();
  return Response.json(
    body: {
      'status': true,
      'message': 'Deleted data',
      'data': newTodo,
    },
  );
}
