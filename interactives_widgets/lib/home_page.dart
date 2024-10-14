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
  DateTime? _datePicked = DateTime.now();
  TimeOfDay _timePicked = TimeOfDay.now();

  Future<void> _pickDate() async {
    final newDate = await showDatePicker(
      context: context,
      firstDate: DateTime(1980),
      lastDate: DateTime(3000),
      currentDate: DateTime.now(),
    );
    if (newDate != null && newDate != _datePicked) {
      setState(() {
        _datePicked = newDate;
      });
    }
  }

  Future<void> _pickTime() async {
    final newTime = await showTimePicker(
      context: context,
      initialTime: _timePicked,
    );
    if (newTime != null && newTime != _timePicked) {
      setState(() {
        _timePicked = newTime;
      });
    }
  }

  String readableDate(DateTime? date) {
    if (date == null) {
      return "Aucune date choisie";
    } else {
      final year = date.year;
      final month = date.month;
      final day = date.day;
      return "La date choisie est : $day/$month/$year";
    }
  }

  String readableTime() {
    final hour = _timePicked.hour;
    final minute = _timePicked.minute;
    return "$hour:$minute";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(readableDate(_datePicked)),
            TextButton(
              onPressed: _pickDate,
              child: const Text("Modifier la date"),
            ),
            Text(readableTime()),
            TextButton(
              onPressed: _pickTime,
              child: const Text("Modifier l'heure"),
            ),
          ],
        ),
      ),
    );
  }
}
