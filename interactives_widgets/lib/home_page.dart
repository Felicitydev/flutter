import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({super.key, required this.title});

  @override
  State<HomePage> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {

  List<User> users = [
    User("Boland", Colors.red),
    User("Maelys", Colors.blue),
    User("Maissane", Colors.purple),
    User("Yohane", Colors.greenAccent),
    User("Maxime", Colors.black38)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
      body: Center(
        child: Wrap(
          children: users.map((user) {
            return Chip(
              label: Text(user.name),
              avatar: CircleAvatar(
                backgroundColor: user.color,
                child: Text(user.name[0]),
              ),
              onDeleted: () {
                users.remove(user);
              },
            );
          }).toList()
        ),
      ),
    );
  }
}

class User {
  String name;
  Color color;

  User(this.name, this.color);
}