import 'package:chat_app/Service/websocket.dart';
import 'package:chat_app/providers/chatprovider.dart';
import 'package:chat_app/providers/mainlistprovider.dart';
import 'package:chat_app/providers/themeprovider.dart';
import 'package:chat_app/views/screens/Settings.dart';
import 'package:chat_app/views/screens/chat.dart';
import 'package:chat_app/views/screens/home.dart';
import 'package:chat_app/views/screens/login.dart';
import 'package:chat_app/views/screens/mainlist.dart';
import 'package:chat_app/views/screens/register.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => WebSocketProvider()),
        ChangeNotifierProvider(create: (_) => MainListProvider()),
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
        ),
        ChangeNotifierProvider(create: (_) => Chatprovider())
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: themeProvider.themeMode,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        primaryColor: Colors.white,
        cardColor: Colors.yellow[900],
        hoverColor: Colors.yellow[800],
        hintColor: Colors.black,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        hintColor: Colors.white,
        primaryColor: const Color.fromARGB(255, 52, 50, 50),
        cardColor: const Color.fromARGB(255, 0, 0, 0),
        hoverColor: const Color.fromARGB(255, 255, 255, 255),
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => const Omboarding(),
        Register.register: (context) => const Register(),
        Omboarding.home: (context) => const Omboarding(),
        MainList.mainList: (context) => const MainList(),
        Settings.settings: (context) => const Settings(),
        Login.login: (context) => const Login(),
        Chat.chat: (context) => const Chat(),
      },
    );
  }
}
