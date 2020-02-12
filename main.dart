import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.orange,
      title: 'calculator',
      home: Homescreen(),
    );
  }
}

class Homescreen extends StatefulWidget {
  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  String output = "0";
  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  buttonPressed(String buttontext) {
    if (buttontext == "CLEAR") {
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else if (buttontext == "+" ||
        buttontext == "-" ||
        buttontext == "*" ||
        buttontext == "/") {
      num1 = double.parse(output);
      operand = buttontext;
      _output = "0";
    } else if (buttontext == ".") {
      if (_output.contains(".")) {
        print("Already contains a decimal");
        return;
      } else {
        _output = _output + buttontext;
      }
    } else if (buttontext == "=") {
      num2 = double.parse(output);

      if (operand == "+") {
        _output = (num1 + num2).toString();
      }
      if (operand == "-") {
        _output = (num1 - num2).toString();
      }
      if (operand == "*") {
        _output = (num1 * num2).toString();
      }
      if (operand == "/") {
        _output = (num1 / num2).toString();
      }

      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else {
      _output = _output + buttontext;
    }
    print(_output);
    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget buildbutton(String buttontext) {
    return Expanded(
      child: OutlineButton(
        textColor: Colors.orange,
      
       
        padding: EdgeInsets.all(24.0),
        child: Text(
          buttontext,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        onPressed: () => buttonPressed(buttontext),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple calculator',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                letterSpacing: 12.5)),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
                child: Text(
                  output,
                  style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                )),
            Expanded(child: Divider()),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    buildbutton("7"),
                    buildbutton("8"),
                    buildbutton("9"),
                    buildbutton("/"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildbutton("4"),
                    buildbutton("5"),
                    buildbutton("6"),
                    buildbutton("*"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildbutton("3"),
                    buildbutton("2"),
                    buildbutton("1"),
                    buildbutton("-"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildbutton("."),
                    buildbutton("0"),
                    buildbutton("00"),
                    buildbutton("+"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildbutton("CLEAR"),
                    buildbutton("="),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
