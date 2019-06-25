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
        primarySwatch: Colors.red,
        //brightness: Brightness.dark,
        //primaryColor: Colors.lightBlue[800],
        accentColor: Colors.yellow[600]
      ),
      home: const MyHomePage(
        title: 'Farmacia',
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
            flex: 1,
            child: Container(
              color: Colors.red[50],
              width: 50,
              height: 55,
              child: Center(
                child: Text(
                document['name'],
                //style: Theme.of(context).textTheme.body2,
                style: TextStyle(fontWeight: FontWeight.bold,),
              ),
              ), 
            ),
//            child: Text(
              //bandInfo.name,
//              document['name'],
//              style: Theme.of(context).textTheme.body2,
//            ),
          ),
          Container(
            //color: Colors.blue[100],
            width: 80,
            height: 55,
            decoration: const BoxDecoration(
              color: Color.fromARGB(0xFF,0xF4,0xD1,0x80),
            ),
            padding: const EdgeInsets.all(10.0),
            child: Text(
              //document['votes'].toString(),
              'Bs ' + document['precio'].toString(),
              style: Theme.of(context).textTheme.body2,
              //style: TextStyle(fontWeight: FontWeight.bold,),
            ),
          ),
          Container(
            width: 80,
            height: 55,
            decoration: const BoxDecoration(
              color: Color.fromARGB(0xFF,0xFF,0xFF,0x8D),
            ),
            padding: const EdgeInsets.all(10.0),
            child: Text(
              //document['votes'].toString(),
              document['cantidad'].toString() + ' uni',
              style: Theme.of(context).textTheme.body1,
              //style: TextStyle(fontWeight: FontWeight.bold,),
            ),
          ),
          Divider(),
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
          if (!snapshot.hasData) return Center(
                child: Text("Cargando... "),
              );

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