import 'package:flutter/material.dart';
import '../data/shared_pref.dart';
import './password_details.dart';
import '../data/sembast_db.dart';
import '../mothers/password.dart';

class PasswordsScreen extends StatefulWidget {
  @override
  _PasswordsScreenState createState() => _PasswordsScreenState();
}

class _PasswordsScreenState extends State<PasswordsScreen> {
  int settingColor = 0xff1976d2;
  late SembastDb db;
  double fontSize = 16.0;
  SPSettings settings = SPSettings();
  @override
  void initState() {
    db = SembastDb();
    settings.init().then((value) {
      setState(() {
        settingColor = settings.getColor();
        fontSize = settings.getFontSize();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Passwords List'),
        backgroundColor: Color(settingColor),
      ),
      body: FutureBuilder(
        future: getPasswords(),
        builder: (BuildContext , AsyncSnapshot<dynamic> snapshot) {
          List<Password> passwords = snapshot.data ?? [];
          return ListView.builder(
            itemCount: passwords == null ? 0 : passwords.length,
            itemBuilder: (_, index){
              return Dismissible(
                key: Key(passwords[index].id.toString()), 
                onDismissed: (_){
                  db.deletePassword(passwords[index]);
                },
                child: ListTile(
                  title: Text(
                    passwords[index].name,
                    style: TextStyle(fontSize: fontSize),
                  ),
                  trailing: const Icon(Icons.edit),
                  onTap: () {
                    showDialog(
                      context: context, 
                      builder: (context){
                        return PasswordDetailDialog(passwords[index], false);
                      });
                  },
                ),
                );
            });
        }),
      
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Color(settingColor),
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return PasswordDetailDialog(Password('', ''), true);
                });
          }),
    );
  }

  Future<List<Password>> getPasswords() async{
    List<Password> passwords = await db.getPasswords();
    return passwords;
  }

}