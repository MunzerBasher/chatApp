import 'package:chat_app/providers/mainlistprovider.dart';
import 'package:chat_app/providers/themeprovider.dart';
import 'package:chat_app/models/item.dart';
import 'package:chat_app/views/screens/Settings.dart';
import 'package:chat_app/views/screens/chat.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainList extends StatelessWidget {
  const MainList({super.key});
  static const mainList = "mainList";
  @override
  Widget build(BuildContext context) {
    final listProvider = Provider.of<MainListProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const MainListAppBar(),
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).cardColor,
        actions: const [
          CustomPopupMenuButton(),
        ],
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: Container(
        decoration: BoxDecoration(color: Theme.of(context).primaryColor),
        margin: const EdgeInsets.only(left: 0.5, right: 0.5),
        child: ListView.builder(
            itemCount: listProvider.items.length,
            itemBuilder: (_, index) {
              Item item = listProvider.items[index];
              return InkWell(
                onTap: () => Navigator.pushNamed(context, Chat.chat),
                child: ListItem(
                  item: item,
                ),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).hoverColor,
          onPressed: () {},
          child: Icon(
            color: Theme.of(context).primaryColor,
            Icons.add,
            size: 25,
          )),
    );
  }
}

class CustomPopupMenuButton extends StatelessWidget {
  const CustomPopupMenuButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
        icon: const Icon(
          Icons.more_vert,
          color: Colors.white,
        ),
        onSelected: (String val) {
          Navigator.pushNamed(context, Settings.settings);
        },
        itemBuilder: (_) {
          return <PopupMenuEntry<String>>[
            PopupMenuItem<String>(
                value: "group",
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Mode"),
                    Consumer<ThemeProvider>(
                      builder: (context, themeProvider, child) => IconButton(
                        onPressed: () => themeProvider.toggleTheme(true),
                        icon: Icon(
                          themeProvider.icon,
                          color: themeProvider.isDarkMode
                              ? Colors.yellow[800]
                              : Colors.black,
                        ),
                      ),
                    )
                  ],
                )),
            const PopupMenuItem<String>(
              value: "broadcast",
              child: Text("New broadcast"),
            ),
            const PopupMenuItem<String>(
              value: "Read",
              child: Text("Read all"),
            ),
            const PopupMenuItem<String>(
              value: "Settings",
              child: Text("Settings"),
            ),
          ];
        });
  }
}

class MainListAppBar extends StatelessWidget {
  const MainListAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'MessageMe',
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        Row(
          children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                )),
          ],
        )
      ],
    );
  }
}

class ListItem extends StatelessWidget {
  const ListItem({super.key, required this.item});
  final Item item;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 8,
      decoration: BoxDecoration(color: Theme.of(context).primaryColor),
      margin: const EdgeInsets.only(top: 0.5, left: 10),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(1000),
              child: Image.asset(
                item.url,
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      title: item.name,
                      topM: 25,
                      leftM: 15,
                    ),
                    CustomText(
                      title: item.message,
                      topM: 10,
                      leftM: 20,
                    ),
                  ],
                ),
                CustomText(
                  title: item.date,
                  topM: 30,
                  rigthM: 15,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  const CustomText(
      {super.key,
      required this.title,
      this.fontSize,
      this.fontWeight,
      this.leftM,
      this.rigthM,
      this.topM,
      this.bottomM,
      this.color,
      this.texcolor});
  final String title;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? leftM;
  final double? rigthM;
  final double? topM;
  final double? bottomM;
  final Color? color;
  final Color? texcolor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: topM ?? 1,
          right: rigthM ?? 1,
          bottom: bottomM ?? 1,
          left: leftM ?? 1),
      decoration: BoxDecoration(color: color),
      child: Text(
        title,
        style: TextStyle(
            fontWeight: fontWeight, fontSize: fontSize, color: texcolor),
      ),
    );
  }
}
