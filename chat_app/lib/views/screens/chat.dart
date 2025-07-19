import 'package:chat_app/providers/chatprovider.dart';
import 'package:chat_app/views/screens/login.dart';
import 'package:chat_app/views/screens/mainlist.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});
  static const String chat = 'chat';
  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    final chats = Provider.of<Chatprovider>(context, listen: false).chats;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).cardColor,
        title: const CustomAppBar(),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
          child: Container(
        margin: const EdgeInsets.all(2),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ChatList(
                list: chats,
              ),
              const CustomchatTextFormField(),
            ],
          ),
        ),
      )),
    );
  }
}

class CustomchatTextFormField extends StatelessWidget {
  const CustomchatTextFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height / 20,
        margin: const EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                flex: 8,
                child: TextFormField(
                  decoration: InputDecoration(
                    suffixIcon: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.emoji_emotions)),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.image)),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.camera_alt))
                          ],
                        )
                      ],
                    ),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(14.0))),
                  ),
                )),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).hoverColor,
                    borderRadius: BorderRadius.circular(25)),
                child: IconButton(
                    onPressed: () => () {},
                    icon: const Icon(Icons.record_voice_over)),
              ),
            ),
          ],
        ));
  }
}

class ChatList extends StatelessWidget {
  const ChatList({
    super.key,
    required this.list,
  });
  final List<String> list;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height -
            (MediaQuery.of(context).size.height / 5.7),
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            bool isLeft = index % 2 == 0;
            return Align(
              alignment: isLeft ? Alignment.centerLeft : Alignment.centerRight,
              child: Container(
                margin: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height / 150,
                  horizontal: 10,
                ),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: isLeft
                      ? const Color.fromARGB(255, 101, 124, 239)
                      : const Color.fromARGB(255, 36, 123, 108),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: CustomText(
                  title: list[index],
                  texcolor: Theme.of(context).hintColor,
                ),
              ),
            );
          },
        ));
  }
}
