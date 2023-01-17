import 'dart:ui';

import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: MyWidget()));

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});
  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  int _counter = 0;

  void addCounter() => setState(() {
        _counter++;
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'My App',
            style:
                TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w600),
          ),
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => {},
          ),
          backgroundColor: Colors.black,
        ),
        body:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Center(
            child: Text(
              'Counter : $_counter',
              style: const TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const Expanded(
                      child: Center(
                        child: Text(
                          'some text',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                          onPressed: addCounter,
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.amber,
                          ),
                          child: const Text(
                            'click me',
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.purple,
                        padding: const EdgeInsets.all(20.0),
                        child: Image.asset(
                          'assets/images/flutter.png',
                          height: 50.0,
                          scale: 2.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ]),
        ]),
        backgroundColor: Colors.black,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red[900],
          child: const Icon(Icons.add),
          onPressed: () => {},
        ));
  }
}
