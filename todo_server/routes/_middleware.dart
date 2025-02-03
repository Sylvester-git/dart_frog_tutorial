import 'package:dart_frog/dart_frog.dart';
import 'package:todos_data_source/todos_data_source.dart';
import 'package:todos_data_source_impl/todos_data_source_impl.dart';

final _dataSource = TodoDataSourceImpl();
Handler middleware(Handler handler) {
  return handler.use(requestLogger()).use(
        provider<TodosDataSource>((_) => _dataSource),
      );
}
