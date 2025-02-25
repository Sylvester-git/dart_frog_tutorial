import 'package:dart_frog/dart_frog.dart';
import 'package:websocket/counter/middleware/counter_provider.dart';

Handler middleware(Handler handler) {
  return handler.use(counterProvider);
}
