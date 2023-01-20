import 'dart:ui';
import 'data.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: QuoteList()));

class QuoteList extends StatefulWidget {
  const QuoteList({super.key});

  @override
  State<QuoteList> createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {
  List data = [
    Data(
        id: 1, name: 'Leanne Graham', email: 'Sincere@april.biz', status: true),
    Data(
        id: 2, name: 'Ervin Howell', email: 'Shanna@melissa.tv', status: false),
    Data(
        id: 3,
        name: 'Clementine Bauch',
        email: 'Nathan@yesenia.net',
        status: true),
    Data(
        id: 4,
        name: 'Patricia Lebsack',
        email: 'Juliane.OConner@kory.org',
        status: true),
    Data(id: 5, name: ' Dietrich', email: 'Hettinger@annie.ca', status: true),
    Data(id: 6, name: 'Patricia', email: 'Juliane@kory.org', status: true),
    Data(id: 7, name: 'Cilnich', email: 'Lwtinger@annie.ca', status: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        title: const Padding(
            padding: EdgeInsets.only(left: 90.0), child: Text('QuoteList')),
        backgroundColor: Colors.green,
      ),
      body: Column(
          children: data
              .map((e) => Row(
                        children: [
                          Column(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                child: CircleAvatar(child: Text('${e.id}')),
                              )
                            ],
                          ),
                          const SizedBox(width: 20),
                          Container(
                            width: 310,
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('${e.name}',
                                        style: const TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold)),
                                    const SizedBox(height: 5),
                                    Text('${e.email}',
                                        style: const TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 12,
                                            color: Colors.grey))
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Column(children: const [Icon(Icons.more_vert)])
                        ],
                      )
                  // Text('${e.id} ${e.name} ${e.email} ${e.status}'),
                  )
              .toList()),
    );
  }
}
