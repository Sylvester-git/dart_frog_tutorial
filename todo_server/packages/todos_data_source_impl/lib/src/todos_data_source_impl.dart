import 'package:todos_data_source/todos_data_source.dart';
import 'package:uuid/uuid.dart';

/// An in-memory implementation of the [TodosDataSource] interface
class TodoDataSourceImpl implements TodosDataSource {
  /// Map of ID -> Todo
  final _cache = <String, Todo>{};

  @override
  Future<Todo> create(Todo todo) async {
    final id = const Uuid().v4();
    final createTodo = todo.copyWith(id: id);
    _cache[id] = createTodo;
    return createTodo;
  }

  @override
  Future<void> delete(String id) async => _cache.remove(id);

  @override
  Future<Todo?> read(String id) async => _cache[id];

  @override
  Future<List<Todo>> readAll() async => _cache.values.toList();

  @override
  Future<Todo> update(String id, Todo todo) async {
    return _cache.update(id, (value) => todo);
  }
}
