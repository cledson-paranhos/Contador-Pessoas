import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(title: "Contador de pessoas", home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _people = 0;
  String info = "Seja bem vindo !";

  void changePeople(int increment) {
    _people += increment;

    setState(() {
      if (_people < 0.0) {
        info = "Mundo invertido !?";
      } else if (_people <= 10) {
        info = "Seja bem vindo !";
      } else {
        info = "Atenção! Lotado.";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "images/restaurante.jpg",
          fit: BoxFit.cover,
          height: 1000.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Pessoa: $_people",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  decoration: TextDecoration.none),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                      child: Text(
                        "+1",
                        style: TextStyle(color: Colors.white, fontSize: 40.0),
                      ),
                      onPressed: () {
                        changePeople(1);
                      }),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                      child: Text(
                        "-1",
                        style: TextStyle(color: Colors.white, fontSize: 40.0),
                      ),
                      onPressed: () {
                        changePeople(-1);
                      }),
                ),
              ],
            ),
            Text(
              "$info",
              style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.normal,
                  fontSize: 30.0,
                  decoration: TextDecoration.none),
            )
          ],
        ),
      ],
    );
  }
}
