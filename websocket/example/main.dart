import 'package:web_socket_channel/web_socket_channel.dart';

void main() {
  final uri = Uri.parse('ws://localhost:8080/ws');
  final channel = WebSocketChannel.connect(uri);
// Listen to messages from the server.
  channel.stream.listen(
    print,
  );

  // Send a message to the server.
  channel.sink.add('increment');
  channel.sink.add('decrement');

  // Close the connection.
  channel.sink.close();
}
