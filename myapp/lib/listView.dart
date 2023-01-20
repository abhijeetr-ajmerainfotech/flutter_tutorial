import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:core';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // primarySwatch: Colors.blue,
          ),
      home: const APiCall(),
    );
  }
}

class APiCall extends StatefulWidget {
  const APiCall({super.key});

  @override
  State<APiCall> createState() => _APiCallState();
}

class _APiCallState extends State<APiCall> {
  Map data = {};
  List userData = [];

  Future getApiCall() async {
    http.Response response =
        await http.get(Uri.parse('https://dummyjson.com/products'));

    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
      setState(() {
        userData = data['products'];
      });
      print('json data for api---------------------------------------------');
      // print(data);
      print(userData);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getApiCall();
  }

  void handleDelete(index) {
    setState(() {
      userData.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton.icon(
            onPressed: getApiCall,
            label: const Text(''),
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            )),
        title: const Text('Network'),
      ),
      body: ListView.builder(
          itemCount: userData.length == null ? 0 : userData.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 22,
                            backgroundImage:
                                NetworkImage(userData[index]['thumbnail']),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 15.0,
                            ),
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      (userData[index]['brand']),
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      '${(userData[index]['title'])}',
                                      style: const TextStyle(
                                          fontSize: 8,
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 18.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Badge(
                                        shape: BadgeShape.square,
                                        badgeColor: Colors.orange,
                                        borderRadius: BorderRadius.circular(50),
                                        badgeContent: Text(
                                            '₹ ${userData[index]['price']}',
                                            style: TextStyle(fontSize: 10)),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Badge(
                                        shape: BadgeShape.square,
                                        badgeColor: Colors.green,
                                        borderRadius: BorderRadius.circular(50),
                                        badgeContent: Text(
                                            '⭐ ${userData[index]['rating']}',
                                            style: TextStyle(fontSize: 10)),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () => handleDelete(index),
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      )
                    ]),
              ),
            );
          }),
    );
  }
}
