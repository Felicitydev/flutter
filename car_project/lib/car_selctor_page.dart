import 'package:flutter/material.dart';

class CarSelectorPage extends StatefulWidget {
  const CarSelectorPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ClassSelectorPageState();
  }

}

class _ClassSelectorPageState extends State<CarSelectorPage> {

  String _firstName = "";

  Padding _interactiveWidget({required List<Widget> children, bool isRow = false}) {
    return Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            (isRow) ?
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: children,
              )
            : Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: children,
            ),
            const Divider(),
          ],
        ),
    );
  }

  void _updateFirstName(String newValue){
    setState(() {
      _firstName = newValue;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Configurateur de voiture"),
        actions: [
          ElevatedButton(
              onPressed: () {}, 
              child: const Text("Je valide")
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
                "Bienvenu.e: $_firstName",
              style: const TextStyle(
                fontSize: 20,
                color: Colors.lightBlue
              ),
            ),
            _interactiveWidget(
                children: [
                  TextField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Entrez votre nom"
                    ),
                    onSubmitted: _updateFirstName
                  )
                ]
            )
          ],
        ),
      ),
    );
  }
}