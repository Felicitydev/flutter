import 'package:flutter/material.dart';
import '../data/shared_pref.dart';
import '../mothers/fontsize.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  int settingColor = 0xff1976d2;
  double fontSize = 12.0;
  List<int> colors = [
    0xFF455A64,
    0xFFFFC107,
    0xFF673AB7,
    0xFFF57C00,
    0xFF95548
  ];
  SPSettings settings = SPSettings();
  final List<FontSize> fontSizes = [
    FontSize('small', 12.0),
    FontSize('meduim', 16.0),
    FontSize('large', 20.0),
    FontSize('extra-large', 24.0),
  ];

  // read the color and fontsize for the setting and update the setting color variable
  @override
  void initState() {
    settings.initializeSharedPreferences().then((value) {
      setState(() {
        settingColor = settings.getColor();
        fontSize = settings.getFontSize();
      });
    });
    super.initState();
  }

  // @override
  // void initState() {
  //   settings.init().then((value)){
  //     setState((){
  //       settingColor = settings.getColor();
  //     });
  //   };
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting'),
        backgroundColor: Color(settingColor),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Choose a font size for the app',
            style: TextStyle(
              fontSize: fontSize,
              color: Color(settingColor),
            ),
          ),
          DropdownButton(
            value: fontSize.toString(),
            items: getDropdownMenuItems(),
            onChanged: changeSize,
          ),
          Text(
            'App Main color',
            style: TextStyle(
              fontSize: fontSize,
              color: Color(settingColor),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => setColor(colors[0]),
                child: ColorSquare(colors[0]),
              ),
              GestureDetector(
                onTap: () => setColor(colors[1]),
                child: ColorSquare(colors[1]),
              ),
              GestureDetector(
                onTap: () => setColor(colors[2]),
                child: ColorSquare(colors[2]),
              ),
              GestureDetector(
                onTap: () => setColor(colors[3]),
                child: ColorSquare(colors[3]),
              ),
              GestureDetector(
                onTap: () => setColor(colors[4]),
                child: ColorSquare(colors[4]),
              )
            ],
          )
        ],
      ),
    );
  }

  void setColor(int color) {
    setState(() {
      settingColor = color;
      settings.setColor(color);
    });
  }

  List<DropdownMenuItem<String>> getDropdownMenuItems() {
    List<DropdownMenuItem<String>> items = [];
    for (int i = 0; i < fontSizes.length - 1; i++) {
      FontSize fontSize = fontSizes[i];
      items.add(DropdownMenuItem(
        value: fontSize.size.toString(),
        child: Text(fontSize.name),
      ));
    }
    print(items);
    return items;
  }

  void changeSize(String? newSize) {
    settings.setFontSize(double.parse(newSize ?? '14'));
    setState(() {
      fontSize = double.parse(newSize ?? '15');
    });
  }
}

class ColorSquare extends StatelessWidget {
  final int colorCode;
  const ColorSquare(this.colorCode, {super.key});
  // const ColorSquare({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 72,
      height: 72,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          color: Color(colorCode)),
    );
  }
}
