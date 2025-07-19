import 'package:chat_app/views/screens/mainlist.dart';
import 'package:chat_app/views/screens/home.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  static const String login = 'login';
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: CustomText(
          title: 'Login',
          fontSize: 30,
          fontWeight: FontWeight.bold,
          //texcolor: Colors.white,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          //mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const CustomImage(),
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
              title: "Login",
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: MediaQuery.of(context).size.width / 25,
        right: MediaQuery.of(context).size.width / 25,
        top: MediaQuery.of(context).size.width / 35,
      ),
      child: TextFormField(
        decoration: InputDecoration(
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4.0))),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.blue,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(8.0), // Optional
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.yellow[900]!,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            // labelText: 'Enter Text',
            hintText: title),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Row(
              children: [
                const CustomArrowBack(),
                Container(
                  margin: const EdgeInsets.all(1),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(250),
                    child: Image.asset(
                      "assets/images/Annotation 2025-05-22 081632.png",
                      height: 60,
                      width: 60,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            IconButton(
                onPressed: () => () {},
                icon: const Icon(
                  Icons.cameraswitch_sharp,
                  color: Colors.white,
                )),
            IconButton(
                onPressed: () => () {},
                icon: const Icon(
                  Icons.call,
                  color: Colors.white,
                )),
            IconButton(
                onPressed: () => () {},
                icon: const Icon(
                  Icons.more_vert,
                  color: Colors.white,
                )),
          ],
        )
      ],
    );
  }
}

class CustomArrowBack extends StatelessWidget {
  const CustomArrowBack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ));
  }
}
