import 'package:chat_app/models/item.dart';
import 'package:flutter/foundation.dart';

class MainListProvider with ChangeNotifier {
  List<Item> items = [
    Item(
        url: "assets/images/Annotation 2025-05-23 151759.png",
        name: "Munzer basher",
        date: "10:00",
        message: "Hi"),
    Item(
        url: "assets/images/Annotation 2025-05-23 152555.png",
        name: "ali ahmed",
        date: "12:43",
        message: "what is new "),
    Item(
        url: "assets/images/Annotation 2025-05-22 081632.png",
        name: "Mohammed ali",
        date: "01:23",
        message: "i well go to home "),
    Item(
        url: "assets/images/Annotation 2025-05-23 152820.png",
        name: "Adam Mohammed",
        date: "12:20",
        message: "Ok"),
    Item(
        url: "assets/images/Annotation 2025-05-23 152242.png",
        name: "ahmed",
        date: "07:29",
        message: "Good morning"),
    Item(
        url: "assets/images/Annotation 2025-05-22 082332.png",
        name: "Mohammed montaser",
        date: "13:09",
        message: "what are doing"),
    Item(
        url: "assets/images/Annotation 2025-05-22 081632.png",
        name: "momen Mohammed",
        date: "11:20",
        message: "I am find"),
    Item(
        url: "assets/images/Annotation 2025-05-22 082332.png",
        name: "mohanad ali",
        date: "10:56",
        message: "Good morning"),
  ];
}
