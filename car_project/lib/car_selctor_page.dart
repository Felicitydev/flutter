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
  double _kms = 0;
  bool _electric = true;
  List<int> _places = [2, 4, 5, 7];
  int _placesSelected = 2;

  Padding _interactiveWidget(
      {required List<Widget> children, bool isRow = false}) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          (isRow)
              ? Row(
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

  void _updateFirstName(String newValue) {
    setState(() {
      _firstName = newValue;
    });
  }

  void _updateKms(double newValue) {
    setState(() {
      _kms = newValue;
    });
  }

  void _updateEngine(bool newValue) {
    setState(() {
      _electric = newValue;
    });
  }

  void _updatePlaces(int? newValue) {
    setState(() {
      _placesSelected = newValue ?? 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Configurateur de voiture"),
        actions: [
          ElevatedButton(onPressed: () {}, child: const Text("Je valide"))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              "Bienvenu.e: $_firstName",
              style: const TextStyle(fontSize: 20, color: Colors.lightBlue),
            ),
            _interactiveWidget(children: [
              TextField(
                  decoration: const InputDecoration(
                      border: InputBorder.none, hintText: "Entrez votre nom"),
                  onSubmitted: _updateFirstName)
            ]),
            _interactiveWidget(children: [
              Text("Nombre de kilomètres annuel: ${_kms.toInt()}"),
              Slider(min: 0, max: 25000, value: _kms, onChanged: _updateKms)
            ]),
            _interactiveWidget(isRow: true, children: [
              Text(_electric ? "Moteur électrique" : "Moteur thermique"),
              Switch(value: _electric, onChanged: _updateEngine)
            ]),
            _interactiveWidget(children: [
              Text("Nombre de places: $_placesSelected"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: _places.map((place) {
                  return Column(
                    children: [
                      Radio(
                          value: place,
                          groupValue: _placesSelected,
                          onChanged: _updatePlaces)
                    ],
                  );
                }).toList(),
              )
            ])
          ],
        ),
      ),
    );
  }
}
