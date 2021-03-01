import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shareprefarance_chack/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var email = preferences.getString('email');
  runApp(MaterialApp(
    home: email == null ? MyHomePage() : Home(),
  ));
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _namer = new TextEditingController();
  var _pass = new TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String name = 'masrafianam@gmail.com';
  String password = '123';

  Future checkLogin() async {
    if (name == _namer.text && password == _pass.text) {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString('email', _namer.text);
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.only(left: 30, right: 30, top: 100),
        child: Form(
          autovalidate: true,
          key: _formKey,
          child: ListView(
            children: [
              Text("Masrafi"),
              TextFormField(
                // enabled: false,
                //obscureText: true,
                //textAlign: TextAlign.center,
                keyboardType: TextInputType.text,
                controller: _namer,

                validator: (val) {
                  if (val.isEmpty) {
                    return 'আপনি নাম দেননি';
                  } else {}
                },
                decoration: InputDecoration(
                  hintText: 'নাম লিখেন...',
                  // icon: Icon(Icons.location_on),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                      //borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                // enabled: false,
                //obscureText: true,
                //textAlign: TextAlign.center,
                keyboardType: TextInputType.text,
                controller: _pass,

                validator: (val) {
                  if (val.isEmpty) {
                    return 'আপনি নাম দেননি';
                  } else {}
                },
                decoration: InputDecoration(
                  hintText: 'নাম লিখেন...',
                  // icon: Icon(Icons.location_on),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                      //borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 50, right: 50),
                child: GestureDetector(
                  onTap: () {
                    if (_formKey.currentState.validate()) {
                      checkLogin();
                    }
                  },
                  child: Container(
                    height: 50.0,
                    width: 300.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.pink,
                    ),
                    child: Center(
                      child: Text(
                        'জমা দিন',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
