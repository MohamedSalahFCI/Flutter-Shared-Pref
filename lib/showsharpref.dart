import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Showpref extends StatefulWidget {
  @override
  _ShowprefState createState() => _ShowprefState();
}

class _ShowprefState extends State<Showpref> {
  String x = "";
  String nameKey = "_key_name";
  Future<String> loadData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(nameKey);
  }

  setData() {
    loadData().then((value) {
      setState(() {
        x = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Second screen show pref"),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              new Text(x),
              OutlineButton(
                child: Text("Load tany"),
                onPressed: () {
                  setData();
                  print(x);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
