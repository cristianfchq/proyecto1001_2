import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class NewPage extends StatefulWidget {

  final DocumentSnapshot items;
  NewPage({this.items});

  @override
  _NewPageState createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.items['name']),
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection('items').snapshots(),
        builder: (context, snapshot){
          if (!snapshot.hasData) return const Text('Loading... ');

          return _buildListItem();
        },
      ),
    );
  }


  String horseUrl = 'https://cervezapersonalizada.com/81-310-thickbox_default/caja-de-cervezas-personalizadas-la-mejor-enfermera.jpg';

  //https://st.depositphotos.com/1758000/1269/v/450/depositphotos_12691891-stock-illustration-young-nurse-pointing-the-index.jpg
  //https://cervezapersonalizada.com/81-310-thickbox_default/caja-de-cervezas-personalizadas-la-mejor-enfermera.jpg
String cowUrl = 'https://i.stack.imgur.com/XPOr3.png';
String camelUrl = 'https://i.stack.imgur.com/YN0m7.png';
String sheepUrl = 'https://i.stack.imgur.com/wKzo8.png';
String goatUrl = 'https://i.stack.imgur.com/Qt4JP.png';

  @override
  Widget _buildListItem() {
    return ListView(
      children: <Widget>[
        Divider(),
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(horseUrl),
            radius: 50.0,
          ),
          title: Text(
            'Modo de Administracion',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          //subtitle: Text('A strong animal'),
          trailing: Icon(Icons.keyboard_arrow_down),
          onTap: () {
            print('horse');
          },
          //selected: true,
        ),
        ListTile(
          title: Text(
            widget.items['modAdministracion'],
            textAlign: TextAlign.justify,
          ),
          //subtitle: Text('A strong animal'),
          //trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            print('horse');
          },
          //selected: true,
        ),
        Divider(),
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(horseUrl),
            radius: 50.0,
          ),
          title: Text(
            'Mecanismo de Accion',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          //subtitle: Text('A strong animal'),
          trailing: Icon(Icons.keyboard_arrow_down),
          onTap: () {
            print('horse');
          },
          //selected: true,
        ),
        ListTile(
          title: Text(
            widget.items['mecAccion'],
            textAlign: TextAlign.justify,
          ),
          //subtitle: Text('Provider of milk'),
          //trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            print('cow');
          },
        ),
        Divider(),
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(horseUrl),
            radius: 50.0,
          ),
          title: Text(
            'Contraindicaciones',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          //subtitle: Text('A strong animal'),
          trailing: Icon(Icons.keyboard_arrow_down),
          onTap: () {
            print('horse');
          },
          //selected: true,
        ),
        ListTile(
          title: Text(
            widget.items['contraindicaciones'],
            textAlign: TextAlign.justify,
          ),
          //subtitle: Text('Comes with humps'),
          //trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            print('camel');
          },
          //enabled: false,
        ),
        Divider(),
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(horseUrl),
            radius: 50.0,
          ),
          title: Text(
            'Advertencia y Precaucion',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          //subtitle: Text('A strong animal'),
          trailing: Icon(Icons.keyboard_arrow_down),
          onTap: () {
            print('horse');
          },
          //selected: true,
        ),
        ListTile(
          title: Text(
            widget.items['advertenciaPrecauciones'],
            textAlign: TextAlign.justify,
          ),
          //subtitle: Text('Provides wool'),
          //trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            print('sheep');
          },
        ),
        Divider(),
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(horseUrl),
            radius: 50.0,
          ),
          title: Text(
            'Precio',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          //subtitle: Text('A strong animal'),
          trailing: Icon(Icons.keyboard_arrow_down),
          onTap: () {
            print('horse');
          },
          //selected: true,
        ),
        ListTile(
          title: Text(
            'Bs ' + widget.items['precio'].toString(),
            textAlign: TextAlign.justify,
          ),
          //subtitle: Text('Some have horns'),
          //trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            print('goat');
          },
        ),
      ],
    );
  }
}

//class NewPage extends StatelessWidget {

//  final DocumentSnapshot items;
//  NewPage({this.items});
  //final String title;
  //final String body2;
  //NewPage(this.title, this.body2);
  
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text(
//          title,
//        ),
//      ),
//      body: Center(
//        child: Text(
//          body2,
//        ),
//      ),
//    );
//  }
//}
