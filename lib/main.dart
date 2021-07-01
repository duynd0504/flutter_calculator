import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_cal/models/number.dart';
import 'style.dart';
import 'dart:convert';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('Khoi tao dau tien ');
  }

  final controller_a = TextEditingController();
  final controller_b = TextEditingController();
  String result = '';

  @override
  Widget build(BuildContext context) {
    //-----------------------
    double a1 = double.parse(controller_a.text);
    double b1 = double.parse(controller_b.text);
    Num v = new Num(a: a1, b: b1);
    //-----------------------
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.pink,
          title: Center(
            child: Text(
              'Calculator',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          )),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(height: 30.0),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
            child: TextField(
              controller: controller_a,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                labelText: 'Input A: ',
                //hintText: 'a',
                labelStyle: textLableStyle,
              ),
            ),
          ),
          const SizedBox(height: 30.0),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
            child: TextField(
              controller: controller_b,
              autofocus: true,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                labelText: 'Input B: ',
                //hintText: 'a',
                labelStyle: textLableStyle,
              ),
            ),
          ),
          const SizedBox(height: 30.0),
          Row(
            // /crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                  backgroundColor: Colors.pink[500],
                ),
                onPressed: () {
                  setState(() {
                    result = '$a1' '+' '$b1' '=' '${v.cong()}';
                  });
                },
                child: const Text(
                  '+',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  ),
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                  backgroundColor: Colors.pink[500],
                ),
                onPressed: () {
                  setState(() {
                    Num v = new Num(a: a1, b: b1);
                    result = '$a1' '-' '$b1' '=' '${v.tru()}';
                  });
                },
                child: const Text(
                  '-',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  ),
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                  backgroundColor: Colors.pink[500],
                ),
                onPressed: () {
                  setState(() {
                    result = '$a1' 'x' '$b1' '=' '${v.nhan()}';
                  });
                },
                child: const Text(
                  '*',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  ),
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                  backgroundColor: Colors.pink[500],
                ),
                onPressed: () {
                  setState(() {
                    if (b1 == 0) {
                      result = 'B phải khác 0!';
                      //FocusManager.instance;

                    } else {
                      Num v = new Num(a: a1, b: b1);
                      result = '$a1 ' ':' ' $b1' '=' '${v.chia()}';
                    }
                    //controller_b.text = '';
                  });
                },
                child: const Text(
                  '/',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                'Result:',
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                ),
              ),
              Text(
                '$result',
                softWrap: true,
                style: TextStyle(
                  color: Colors.pink[500],
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                ),
              ),
            ],
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   label: const Text(
      //     'Submit',
      //     style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
      //   ),
      //   icon: const Icon(Icons.thumb_up),
      //   backgroundColor: Colors.pink,
      //   onPressed: () {
      //     setState(() {
      //       double a1 = double.parse(controller_a.text);
      //       double b1 = double.parse(controller_b.text);
      //       Num v = new Num(a: a1, b: b1);
      //       result = '$a1' '' '$b1' '=' '${v.cong()}';
      //     });
      //   },
      // )
    );
  }
}
