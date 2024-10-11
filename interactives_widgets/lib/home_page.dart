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
            unFocusMethod1();
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
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: (){
                          FocusScope.of(context).requestFocus(_nextFocus)
                        }, 
                        icon: Icon(Icons.next_plan)
                    ),
                    suffixIconColor: Colors.blue
                  ),
                ),
                const SizedBox(height: 24),
                Padding(
                    padding: const EdgeInsets.all(8),
                  child:TextField(
                    focusNode: _nextFocus,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50)
                        ),
                      icon: const Icon(Icons.person),
                      label: Text("Nom de famille"),
                      hintText: "Entrez votre nom",
                    ),
                  ),
                ),

              ],
            ),
          )),
    );
  }
}
