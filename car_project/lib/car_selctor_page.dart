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
  Map<String, bool> _options = {
    "GPS": false,
    "Caméra de recul": false,
    "Clim par zone": false,
    "Régulateur de vitesse": false,
    "Toit ouvrant": false,
    "Siège chauffant": false,
    "Roue de secours": false,
  };
  String? _image;
  String _result = "";
  
  final List<Car> _cars = [
    Car(name: "MG cyberstar", url: "MG", places: 2, isElectric: true),
    Car(name: "R5 électrique", url: "R5", places: 4, isElectric: true),
    Car(name: "Tesla", url: "Tesla", places: 5, isElectric: true),
    Car(name: "Van VW", url: "Van", places: 7, isElectric: true),
    Car(name: "Alpine", url: "Alpine", places: 2, isElectric: false),
    Car(name: "Fiat 500", url: "Fiat 500", places: 4, isElectric: false),
    Car(name: "Peugeot 3008", url: "P3008", places: 5, isElectric: false),
    Car(name: "Dacia Jogger", url: "Jogger", places: 7, isElectric: false),
  ];
  Car? _carSelected;

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

  void _updateOption(bool? newBool, String key) {
    setState(() {
      _options[key] = newBool ?? false;
    });
  }

  void _handleResult(){
    setState(() {
      _result  = isGoodChoice();
      _carSelected = _cars.firstWhere((car) => car.isElectric == _electric && car.places == _places);
    });
  }

  String isGoodChoice(){
    if (_kms > 15000 && _electric){
      return "Vous devriez penser à prendre un moteur thermique compte tenu du nombre de kilomètres";
    } else if (_kms < 5000 && !_electric){
      return "Vous faites peu de kilomètres, pensez à regarder les voitures électrique";
    }else {
      return "Voici la voiture faite pour vous";
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Configurateur de voiture"),
        actions: [
          ElevatedButton(
              onPressed: _handleResult,
              child: const Text("Je valide")
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              "Bienvenu.e: $_firstName",
              style: const TextStyle(fontSize: 20, color: Colors.lightBlue),
            ),
            Card(
              margin: const EdgeInsets.all(16),
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(_result),
                    (_carSelected == null) ? SizedBox(height: 0) : Image.asset(_carSelected!.urlString, fit: BoxFit.contain),
                    Text(_carSelected?.name ?? "Oui oui mobile")
                  ],
                ),
              ),
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
            ]),
            _interactiveWidget(children: [
              const Text("Option du véhicule"),
              Column(
                children: _options.keys.map((key) {
                  return CheckboxListTile(
                      title: Text(key),
                      value: _options[key],
                      onChanged: ((bol) => _updateOption(bol, key)));
                }).toList(),
              )
            ])
          ],
        ),
      ),
    );
  }
}

class Car{
  String name;
  String url;
  int places;
  bool isElectric;

  Car({required this.name, required this.url, required this.places, required this.isElectric});

  String get urlString => "assets/$name.jpg";
}
