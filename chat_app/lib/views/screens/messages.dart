import 'package:chat_app/Service/websocket.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Messages extends StatelessWidget {
  const Messages({super.key});

  @override
  Widget build(BuildContext context) {
    final wsProvider = Provider.of<WebSocketProvider>(context, listen: false);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('WebSocket with Provider')),
        body: ListView(
          shrinkWrap: true,
          children: [
            ElevatedButton(
              onPressed: () {
                wsProvider.connect('ws://notifications.runasp.net/ws');
              },
              child: Text('Connect'),
            ),
            ElevatedButton(
              onPressed: () {
                wsProvider.sendMessage('Hello from Flutter WebSocket!');
              },
              child: Text('Send Message'),
            ),
            ElevatedButton(
              onPressed: () {
                wsProvider.disconnect();
              },
              child: Text('Disconnect'),
            ),
            Container(
                margin: const EdgeInsets.all(10),
                height: MediaQuery.of(context).size.height / 1.5,
                child: Consumer<WebSocketProvider>(
                    builder: (context, provider, _) {
                  return ListView.builder(
                      itemCount: provider.listreceivedMessage.length,
                      itemBuilder: (_, index) {
                        return (Text(provider.listreceivedMessage[index]));
                      });
                }
                    // Text('Received: ${provider.receivedMessage}');
                    ))
          ],
        ),
      ),
    );
  }
}
