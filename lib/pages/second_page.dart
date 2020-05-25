import 'package:cats/services/database.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {

  const SecondPage({Key key}) : super (key: key); 
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {

  final dbhelper = Databasehelper.instance;

  var myitems = List();
  List<Widget> children = new List<Widget>();

    Future<bool> query() async {
    myitems = [];
    children = [];
    var allrows = await dbhelper.queryall();
    allrows.forEach((row) { 
      myitems.add(row.toString());
      children.add(Card(
      elevation: 5.0,
      margin: EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 5.0
      ),
      child: Container(
        padding: EdgeInsets.all(5.0),
        child: ListTile(
          title: Text(
          row['cats'],
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        onLongPress: () {
          dbhelper.deletedata(row['id']);
          setState(() {

          });
        },
      ),
      ),
    ));
    });
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(builder: (context, snap){
       if(snap.hasData == null){
          return Center(
            child: Text(
              'No Data'
            ),
          );
        }else{
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Adopted Cats',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
          child: Column(
            children: children,
          )
        ),
          );
        }
      },
      future: query(),
    );
   }
}