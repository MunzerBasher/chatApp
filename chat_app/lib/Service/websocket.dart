import 'package:flutter/foundation.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketProvider with ChangeNotifier {
  late WebSocketChannel _channel;
  String _receivedMessage = '';

  String get receivedMessage => _receivedMessage;
  List<String> _listreceivedMessage = [];
  List<String> get listreceivedMessage => _listreceivedMessage;

  bool _isConnected = false;
  bool get isConnected => _isConnected;

  void connect(String url) {
    _channel = WebSocketChannel.connect(Uri.parse(url));
    _isConnected = true;

    _channel.stream.listen(
      (message) {
        _receivedMessage = message;
        print("listen  --->${message + DateTime.now().toString()}");
        _listreceivedMessage = List.from(_listreceivedMessage)
          ..add(message + DateTime.now().toString());
        notifyListeners();
      },
      onDone: () {
        // _isConnected = false;
        notifyListeners();
      },
      onError: (error) {
        print('WebSocket error: $error');
        //_isConnected = false;
        notifyListeners();
      },
    );
  }

  void sendMessage(String message) {
    if (_isConnected) {
      if (_isConnected) print("Send  --->$message");
      _channel.sink.add(message);
      notifyListeners();
    }
  }

  void disconnect() {
    _channel.sink.close();
    _isConnected = false;
    notifyListeners();
  }
}
