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
  Color backgroundColor = Colors.white;
  List<String> _titles = [
    "Learn interactives widgets",
    "Learn flutter"
  ];
  int _titleIndex = 0;

  _update_LongPressed() {
    setState(() {
      backgroundColor = (backgroundColor == Colors.white)
          ? Colors.deepOrangeAccent
          : Colors.white;
    });
  }
CrossAxisAlignment _alignement = CrossAxisAlignment.center;

  _setToStart() {
  setState(() {
    _alignement = CrossAxisAlignment.start;
  });
}
_setToEnd() {
  setState(() {
    _alignement = CrossAxisAlignment.end;
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_titleIndex]),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(
          crossAxisAlignment: _alignement,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                setState(() {
                  backgroundColor = (backgroundColor == Colors.white)
                      ? Colors.black54
                      : Colors.white;
                });
              },
              onLongPress: _update_LongPressed,
              child: const Text("TextButton"),
            ),
            TextButton.icon(
                onPressed: _update_LongPressed,
                label: const Icon(Icons.palette)),

            ElevatedButton(
                onPressed: (){
                  setState(() {
                    int newRandomTitle = Random().nextInt(_titles.length);
                    _titleIndex = newRandomTitle;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.edit),
                    Text("Changer le titre")
                  ],
                )
            ),

            FilledButton(
                onPressed: _setToStart,
                child: const Text("Start")
            ),
            FilledButton(
                onPressed: _setToEnd,
                child: const Text("End")
            ),
            FilledButton.icon(
                onPressed: (){
                  setState(() {
                    _alignement = CrossAxisAlignment.center;
                  });
                },
                label: const Icon(Icons.restart_alt)
            )
          ],
        ),
      ),
    );
  }
}
