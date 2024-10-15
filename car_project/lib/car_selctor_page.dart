import 'package:flutter/material.dart';

class CarSelectorPage extends StatefulWidget {
  const CarSelectorPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ClassSelectorPageState();
  }

}

class _ClassSelectorPageState extends State<CarSelectorPage> {

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
      body: SingleChildScrollView(),
    );
  }
}