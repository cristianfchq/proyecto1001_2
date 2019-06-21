import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Band Name Survey',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(
        title: 'Posible Band Names',
      ),
    );
  }
}


class MyHomePage extends StatelessWidget {

  const MyHomePage({Key key, this.title}):super(key: key);
  final String title;

  @override
  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              //bandInfo.name,
              document['name'],
              style: Theme.of(context).textTheme.body2,
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Color(0xffddddff),
            ),
            padding: const EdgeInsets.all(10.0),
            child: Text(
              //document['votes'].toString(),
              'Bs ' + document['cantidad'].toString(),
              style: Theme.of(context).textTheme.body1,
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Color(0xffdddd00),
            ),
            padding: const EdgeInsets.all(10.0),
            child: Text(
              //document['votes'].toString(),
              document['cantidad'].toString(),
              style: Theme.of(context).textTheme.body1,
            ),
          ),
        ],
      ),
      onTap: (){
        print("Shoul increase votes here");
      },
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection("items").snapshots(),
        builder: (context, snapshot){
          if (!snapshot.hasData) return const Text('Loading... ');

          return ListView.builder(
            itemExtent: 50.0,
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index) => 
              _buildListItem(context, snapshot.data.documents[index]),
          );
        },
          
      ),
    );
  }
}