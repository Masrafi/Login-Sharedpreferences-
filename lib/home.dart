import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shareprefarance_chack/main.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String email = '';
  Future getEmail() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      email = preferences.getString('email');
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getEmail();
  }

  Future logOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove('email');
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MyHomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          RaisedButton(
            child: Text('Log OUT'),
            onPressed: () {
              logOut();
            },
          )
        ],
      ),
    );
  }
}
