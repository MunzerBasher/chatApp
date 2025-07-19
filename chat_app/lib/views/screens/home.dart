import 'package:chat_app/views/screens/login.dart';
import 'package:chat_app/views/screens/register.dart';
import 'package:flutter/material.dart';

class Omboarding extends StatefulWidget {
  const Omboarding({super.key});
  static const String home = 'home';
  @override
  State<Omboarding> createState() => _OmboardingState();
}

class _OmboardingState extends State<Omboarding> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
        ),
        body: Center(
          child: Column(
            children: [
              const CustomImage(),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: const Text(
                  "MessageMe",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
                ),
              ),
              CustomButt(
                onTap: () => Navigator.pushNamed(context, Login.login),
                color: Colors.yellow[900]!,
                title: "Sign in",
                height: 50,
              ),
              CustomButt(
                onTap: () => Navigator.pushNamed(context, Register.register),
                color: Colors.blue[800]!,
                title: "Register",
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomImage extends StatelessWidget {
  const CustomImage({
    super.key,
    this.height,
  });
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(),
      height: height ?? MediaQuery.of(context).size.height / 2,
      child: Image.asset("assets/images/Annotation 2025-05-20 081850.png"),
    );
  }
}

typedef butt = void Function();

class CustomButt extends StatelessWidget {
  const CustomButt(
      {super.key,
      required this.title,
      required this.color,
      this.height,
      this.width,
      this.fontSize,
      required this.onTap});
  final String title;
  final Color color;
  final double? height;
  final double? width;
  final double? fontSize;
  final butt onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height ?? MediaQuery.of(context).size.height / 18,
        margin: EdgeInsets.only(
          left: MediaQuery.of(context).size.width / 25,
          right: MediaQuery.of(context).size.width / 25,
          bottom: MediaQuery.of(context).size.width / 35,
        ),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: fontSize ?? 20),
          ),
        ),
      ),
    );
  }
}
