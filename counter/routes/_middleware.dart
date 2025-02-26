import 'package:dart_frog/dart_frog.dart';

int _count = 0;

Handler middleware(Handler handler) {
  return handler.use(provider<int>((ctx) => ++_count));
}
