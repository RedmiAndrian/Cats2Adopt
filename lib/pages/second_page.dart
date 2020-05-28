import 'package:cats/services/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
          title: Align(
            alignment: Alignment.center,
            child: Text(
            row['cats'],
            style: TextStyle(
              fontSize: 20,
            ),
        ),
          ),
        onLongPress: () {
          showDialog(context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(row['cats']),
              content: Text(
                  'Are your sure you want to abandon this innocent cat?',
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
              actions: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    FlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('CANCEL'),
                    ),
                    SizedBox(width: 5),
                    RaisedButton(
                      onPressed: () {
                        dbhelper.deletedata(row['id']);
                        setState(() {});
                        Navigator.pop(context);
                      },
                      child: Text('ABANDON'),
                      color: Colors.purple,
                    )
                  ],
                )
              ],
            );
          }
          );
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
