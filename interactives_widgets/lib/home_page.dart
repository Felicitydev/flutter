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
  String _simple = "";
  final FocusNode _focus = FocusNode();
  final FocusNode _nextFocus = FocusNode();


  // ces méthodes permettent de fermer le clavier sans avoir à faire le unsubmitted
  void unFocusMethod1() {
    FocusScope.of(context).unfocus();
  }

  void unFocusMethod2() {
    FocusScope.of(context).requestFocus(FocusNode());
  }
  void unFocusMethod3(FocusNode focusNode) {
    focusNode.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: InkWell(
          onTap: () {
            unFocusMethod3(_focus);
          },
          child: Center(
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
                  onSubmitted: (submittedString) {
                    _simple = submittedString;
                  },
                  focusNode: _focus,
                ),
                TextField(
                  focusNode: _nextFocus,
                )
              ],
            ),
          )),
    );
  }
}
