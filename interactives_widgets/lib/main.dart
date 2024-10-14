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
  bool isOn = true;
  double min = 0;
  double max = 100;
  double current = 33;
  FavoritePlat? favoritePlat;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      backgroundColor: isOn ? Colors.white : Colors.black38,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Toggle Switch Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Couleur de background: ${isOn ? 'Light' : 'Dark'}"),
                Switch(
                  value: isOn,
                  onChanged: (newBool) {
                    setState(() {
                      isOn = newBool;
                    });
                  },
                  activeColor: Colors.redAccent,
                  inactiveThumbColor: Colors.orangeAccent,
                  inactiveTrackColor: Colors.lightBlueAccent,
                  activeTrackColor: Colors.purple,
                ),
              ],
            ),
            // Slider Row
            Row(
              children: [
                Text(min.toString()),
                Expanded(
                  child: Slider(
                    min: min,
                    max: max,
                    value: current,
                    onChanged: (newValue) {
                      setState(() {
                        current = newValue;
                      });
                    },
                    divisions: 5,
                    activeColor: Colors.blue,
                    inactiveColor: Colors.black12,
                  ),
                ),
                Text(max.toString()),
              ],
            ),
            Text("Valeur du slider = ${current.toInt()}"),
            // Favorite Plat Section

          ],
        ),
      ),
    );
  }
}

enum FavoritePlat { Okok, Eru, Poulet_DG, Met_de_pistache }
