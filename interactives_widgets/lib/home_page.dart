import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  final String title;

  const HomePage({super.key, required this.title});

  @override
  State<HomePage> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage>{

  int _counter=0;

  void _onButtonPressed(){
    setState(() {
      _counter++;
    });
  }

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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                "Vous avez appuyé sur le boutton:",
                style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
                "$_counter fois",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 28,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: _onButtonPressed,
          tooltip: "Incrémentez le compteur",
          label: const Text("Appuyez moi!"),
          icon: const Icon(Icons.add),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
    );
  }
}