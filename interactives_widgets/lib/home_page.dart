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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Couleur de background: ${isOn ? 'Light' : "Dark"}"),
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
                )
              ],
            ),
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
                    )
                ),
                Text(max.toString())

              ],
            ),
            Text(("Valeur du slider = ${current.toInt()}")),
            Column(
              children: [
                const Text("Le meilleur plat du monde"),
                Column(
                  children: FavoritePlat.values.map((plat){
                    return Row(
                      children: [
                        Text(favoritePlat?.name ?? "Aucun plat sélectionné!"),
                        Radio(
                          activeColor: Colors.lightGreen,
                            value: plat,
                            groupValue: favoritePlat,
                            onChanged: (plat){
                              setState(() {
                                favoritePlat = plat;
                              });
                            }
                        )
                      ],
                    );
                  }).toList()
                )

              ],
            )
          ],
        ),
      )
    );
  }
}

enum FavoritePlat {Okok, Eru, Poulet_DG, Met_de_pistache}
