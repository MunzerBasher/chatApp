import 'package:chat_app/views/screens/login.dart';
import 'package:chat_app/views/screens/mainlist.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});
  static const String settings = 'settings';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(
              children: [
                CustomArrowBack(),
                CustomText(
                  title: "Settings",
                  texcolor: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ],
            ),
            IconButton(
                onPressed: () => () {},
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ))
          ],
        ),
        backgroundColor: Theme.of(context).cardColor,
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
          child: ListView(
        //shrinkWrap: true,
        children: [
          const UserAcount(),
          Divider(
            height: 0.0,
            color: Theme.of(context).hintColor,
          ),
          const CustomListItem(
            title: "Account",
            icon: Icons.key,
            list: ["Securtiy notifications", "Change number"],
          ),
          const CustomListItem(
            title: "Privacy",
            icon: Icons.lock,
            list: ["Block contacts", "disappearing messages"],
          ),
          const CustomListItem(
            title: "Avatar",
            icon: Icons.align_vertical_top_sharp,
            list: ["Create", "edit", "profile phote"],
          ),
          const CustomListItem(
            title: "Lists",
            icon: Icons.list,
            list: ["Manage people and groups"],
          ),
          const CustomListItem(
            title: "Chats",
            icon: Icons.chat,
            list: ["Theme" "wallpapers", "chat history"],
          ),
          const CustomListItem(
            title: "Notifications",
            icon: Icons.notifications,
            list: ["essages, groups & call tones"],
          ),
          const CustomListItem(
            title: "Storage and data",
            icon: Icons.circle,
            list: ["Network usage, auto-download "],
          ),
        ],
      )),
    );
  }
}

class CustomListItem extends StatelessWidget {
  const CustomListItem({
    super.key,
    required this.title,
    required this.icon,
    required this.list,
  });
  final String title;
  final IconData icon;
  final List<String> list;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 5, right: 5, bottom: 40),
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    icon,
                    size: 30,
                  ))),
          Expanded(
            flex: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  title: title,
                  texcolor: Theme.of(context).hintColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                CustomText(
                  title: text(list),
                  texcolor: Theme.of(context).hintColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class UserAcount extends StatelessWidget {
  const UserAcount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 8,
      decoration: BoxDecoration(color: Theme.of(context).primaryColor),
      margin: const EdgeInsets.only(top: 0.5, left: 10, right: 10),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(1000),
              child: Image.asset(
                "assets/images/Annotation 2025-05-22 081632.png",
                height: 60,
                width: 60,
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomText(
                      title: "Munzer ",
                      topM: 25,
                    ),
                    CustomText(
                      title: "i am her",
                      topM: 10,
                      leftM: 20,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      margin: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            color: Theme.of(context).hoverColor,
                            Icons.qr_code_scanner_outlined,
                            size: 30,
                          )),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.add_circle,
                          color: Theme.of(context).hoverColor,
                          size: 30,
                        )),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

String text(List<String> list) {
  String tex = "";
  for (int i = 0; i < list.length; i++) {
    tex += list[i];
    if (i < list.length - 1) tex += ",";
  }
  return tex;
}
