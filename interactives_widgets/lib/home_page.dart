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

  Color backgroundColor = Colors.white;

  _update_LongPressed(){
    setState(() {
      backgroundColor = (backgroundColor == Colors.white) ? Colors.deepOrangeAccent : Colors.white;

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
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: (){
                  setState(() {
                    backgroundColor = (backgroundColor == Colors.white) ? Colors.black54 : Colors.white;
                  });
                },
                onLongPress: _update_LongPressed,
                child: const Text("TextButton"),
            ),
            TextButton.icon(
                onPressed: _update_LongPressed,
                label: const Icon(Icons.palette)
            )
          ],
        ),
      ),

    );
  }
}