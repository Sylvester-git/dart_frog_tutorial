import 'package:dart_frog/dart_frog.dart';
import 'package:dart_frog_auth/dart_frog_auth.dart';
import 'package:jwt/authenticator.dart';
import 'package:jwt/user.dart';

Handler middleware(Handler handler) {
  // Provide the authenticator to the context first.

  return handler
      .use(requestLogger())
      .use(
        provider<Authenticator>(
          (_) => Authenticator(),
        ),
      )
      .use(
    bearerAuthentication<User>(
      authenticator: (context, token) async {
        final authenticator = context.provide<Authenticator>(() {
          return Authenticator();
        });
        return authenticator.read<Authenticator>().verifyToken(token);
      },
    ),
  );
}
