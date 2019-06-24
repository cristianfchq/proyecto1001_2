import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proyecto1001_2/new_page.dart';

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


class MyHomePage extends StatefulWidget {

  const MyHomePage({Key key, this.title}):super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

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
              style: Theme.of(context).textTheme.body2,
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
        navigateToNewPage(document);
      },
    );
  }

  navigateToNewPage(DocumentSnapshot items){
  //Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(items: items,)));
  //Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(items: items,)));
    Navigator.push(context, MaterialPageRoute(builder: (context) => NewPage(items: items,)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection('items').snapshots(),
        builder: (context, snapshot){
          if (!snapshot.hasData) return const Text('Loading... ');

          return ListView.builder(
            itemExtent: 60.0,
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index) => 
              _buildListItem(context, snapshot.data.documents[index]),
          );
        },
      ),
    );
  }



}