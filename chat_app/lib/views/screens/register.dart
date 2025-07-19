import 'package:chat_app/views/screens/home.dart';
import 'package:chat_app/views/screens/login.dart';
import 'package:chat_app/views/screens/mainlist.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});
  static const String register = 'register';
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: CustomText(
            title: 'Register',
            fontSize: 30,
            fontWeight: FontWeight.bold,
            //texcolor: Colors.white,
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: ListView(
            children: [
              CustomImage(height: MediaQuery.of(context).size.height / 3),
              const CustomTextFormField(
                title: "Enter Your First Name",
              ),
              const CustomTextFormField(
                title: "Enter Your Last Name ",
              ),
              const CustomTextFormField(
                title: "Enter Your Email",
              ),
              const CustomTextFormField(
                title: "Enter Your Password",
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 20,
              ),
              CustomButt(
                onTap: () => Navigator.pushNamed(context, MainList.mainList),
                color: Colors.yellow[900]!,
                title: "Continue",
                height: 50,
              ),
            ],
          ),
        ));
  }
}
