import 'dart:math';

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

  List<String> values = ["Poulet", "Boeuf", "Porc"];
  String _selected = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          PopupMenuButton <String>(
            icon: const Icon(Icons.settings),
            onSelected: (newValue){
              setState(() {
                _selected = newValue;
              });
            },
              itemBuilder: (context){
                return values.map((viande) {
                  return PopupMenuItem<String>(
                      value: viande,
                    child: Text(viande),
                  );
                }).toList();
              }
          )
        ],
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Text(_selected),
      ),
    );
  }
}
