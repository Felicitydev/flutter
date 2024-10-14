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
  bool isOn = true;
  double min = 0;
  double max = 100;
  double current = 33;
  FavoritePlat? favoritePlat;

  Map<String, bool> groceries = {
    "Banane": false,
    "Oeufs": false,
    "Pates": false,
    "Beurre": false,
    "Poulet": false,
    "Mayonnaise": false,
    "Céréales": false,
    "Café": false,
    "Persil": false,
    "Courgettes": false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        backgroundColor: isOn ? Colors.white : Colors.black38,
        body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: groceries.keys.map((key) {
                return CheckboxListTile(
                    title: Text(key),
                    subtitle:
                        Text(groceries[key]! ? "Dans le panier " : "A acheter"),
                    value: groceries[key],
                    onChanged: (bol) {
                      setState(() {
                        groceries[key] = bol ?? false;
                      });
                    });
              }).toList()),
        ));
  }
}

enum FavoritePlat { Okok, Eru, Poulet_DG, Met_de_pistache }
