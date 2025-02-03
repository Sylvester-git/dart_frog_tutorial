import 'package:dart_frog/dart_frog.dart';

Response onRequest(RequestContext context) {
  //! Access the incoming request.
  // final request = context.request;

  // //! Access the HTTP method.
  // final method = request.method.value;

  // //! Access the headers as a `Map<String, String>`.
  // final headers = request.headers;

  //! Access the query parameters as a `Map<String, String>`.

  // final params = request.uri.queryParameters;
  // //! Get the value for the key `name`.
  // //! Default to `there` if there is no query parameter.
  // final name = params['name'] ?? 'There';

  // //! Access the request body as a `String`.
  // final body = await request.body();

  // //! Access the request body as a `Map<String, dynamic>`.
  // final body = await request.json();

  //! Access the request body form data.
  // final formData = await request.formData();

  // //! Retrieve an uploaded file.
  // final photo = formData.files['image'];

  // if (photo == null ||
  //     photo.contentType.mimeType != ContentType.binary.mimeType) {
  //   return Response.json(
  //     statusCode: HttpStatus.badRequest,
  //     body: {
  //       'status': false,
  //       'message': 'Error uploading image',
  //     },
  //   );
  // }

  // return Response.json(
  //   body: {
  //     'status': true,
  //     'message': 'Successfully uploaded ${photo.name}',
  //   },
  // );

  // return Response(
  //   body: '"Request formadata:" ${formData.fields}',
  // );

  return Response.json(
    headers: {'content-type': 'application/json'},
    body: {
      'status': true,
      'messsage': 'Authenication endpoint',
    },
  );
}
