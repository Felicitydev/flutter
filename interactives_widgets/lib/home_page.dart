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
  String _simple="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          children: [
            Text("Textfield simple: $_simple"),
            TextField(
              textAlign: TextAlign.center,
              keyboardType: TextInputType.text,
              obscureText: true,
              onChanged: (newString) {
                setState(() {
                  _simple = newString;
                });
              },
              onSubmitted: (submittedString){
                _simple = submittedString;
              },
            ),
          ],
        ),
      ),
    );
  }
}

