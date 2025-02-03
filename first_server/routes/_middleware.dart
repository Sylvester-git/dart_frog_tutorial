import 'package:dart_frog/dart_frog.dart';

Handler middleware(Handler handler) {
  //! Log all request from the root directory
  return handler.use(requestLogger());

  // //! Provider for simple cases
  // return handler.use(provider<String>((context) => 'Welcome young lad'));

  //! Provider for complex  cases
  // return handler.use(greetingProvider());
}

// //! Provider for complex  cases
// Middleware greetingProvider() {
//   return provider<String>((ctx) => 'Hello guys');
// }
