import 'package:cats/services/database.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

void main() => runApp(MaterialApp(
  title: 'CATS 2 ADOPT',
  theme: ThemeData(
    primarySwatch: Colors.purple,
  ),
  debugShowCheckedModeBanner: false,
  home: FirstPage(),
));

class FirstPage extends StatefulWidget {

  const FirstPage({Key key}) : super(key: key);

  @override
  FirstPageState createState() => FirstPageState();
}

class FirstPageState extends State<FirstPage> {

  final dbhelper =  Databasehelper.instance;

  void  insertdata(name) async {
	  Map<String, dynamic> row = {
		Databasehelper.columnName:  name,
	  };
	  final id =  await dbhelper.insert(row);
	  print(id);
    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cats to adopt',
          style: TextStyle(
            fontSize: 20
          )
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: 
            ListView(
              children:<Widget> [
                GestureDetector(
                  onTap: () {
                    showDialog(context: context, 
                    builder: (context) {
                    return AlertDialog(
                      title: Text(
                        'Niko',
                        style: TextStyle(
                          fontSize: 25,
                        )
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment:CrossAxisAlignment.stretch,
                        children: <Widget> [
                          Image.asset('assets/niko.jpeg'),
                          SizedBox(height: 10),
                          Text(
                            'The SEXIEST cat alive!!',
                            style: TextStyle(
                              fontSize:18,
                            ),
                          ),
                        ],
                      ),
                      actions: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children:<Widget> [
                            FlatButton(
                              onPressed: (){
                                Navigator.pop(context);
                              },
                              child: Text(
                                'I\'M ALERGIC!',
                              )
                            ),
                            SizedBox(width: 5),
                            RaisedButton(
                              color: Colors.purple,
                              onPressed: (){
                                insertdata("Niko");
                                Navigator.pop(context);
                              },
                              child: Text(
                                'ADOPT',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    );
                    });
                  },
                  child: Card(
                    child: ListTile(
                      title: Text(
                        'Niko',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    )
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(context: context, 
                    builder: (context) {
                    return AlertDialog(
                      title: Text(
                        'Ano',
                        style: TextStyle(
                          fontSize: 25,
                        )
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment:CrossAxisAlignment.stretch,
                        children: <Widget> [
                          Image.asset('assets/ano.jpeg'),
                          SizedBox(height: 10),
                          Text(
                            'The only kitten in the family',
                            style: TextStyle(
                              fontSize:18,
                            ),
                          ),
                        ],
                      ),
                      actions: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children:<Widget> [
                            FlatButton(
                              onPressed: (){
                                Navigator.pop(context);
                              },
                              child: Text(
                                'I\'M ALERGIC!',
                              )
                            ),
                            SizedBox(width: 5),
                            RaisedButton(
                              color: Colors.purple,
                              onPressed: (){
                                insertdata("Ano");
                                Navigator.pop(context);
                              },
                              child: Text(
                                'ADOPT',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    );
                    });
                  },
                  child: Card(
                    child: ListTile(
                      title: Text(
                        'Ano',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(context: context, 
                    builder: (context) {
                    return AlertDialog(
                      title: Text(
                        'Takong',
                        style: TextStyle(
                          fontSize: 25,
                        )
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment:CrossAxisAlignment.stretch,
                        children: <Widget> [
                          Image.asset('assets/takong.jpg'),
                          SizedBox(height: 10),
                          Text(
                            'He is a fierce cat, yet adorable',
                            style: TextStyle(
                              fontSize:18,
                            ),
                          ),
                        ],
                      ),
                      actions: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children:<Widget> [
                            FlatButton(
                              onPressed: (){
                                Navigator.pop(context);
                              },
                              child: Text(
                                'I\'M ALERGIC!',
                              )
                            ),
                            SizedBox(width: 5),
                            RaisedButton(
                              color: Colors.purple,
                              onPressed: (){
                                insertdata("Takong");
                                Navigator.pop(context);
                              },
                              child: Text(
                                'ADOPT',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    );
                    });
                  },
                  child: Card(
                    child: ListTile(
                      title: Text(
                        'Takong',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(context: context, 
                    builder: (context) {
                    return AlertDialog(
                      title: Text(
                        'Amor',
                        style: TextStyle(
                          fontSize: 25,
                        )
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment:CrossAxisAlignment.stretch,
                        children: <Widget> [
                          Image.asset('assets/amor.jpeg'),
                          SizedBox(height: 10),
                          Text(
                            'She is a good cat and she loves to be pet by the owner',
                            style: TextStyle(
                              fontSize:18,
                            ),
                          ),
                        ],
                      ),
                      actions: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children:<Widget> [
                            FlatButton(
                              onPressed: (){
                                Navigator.pop(context);
                              },
                              child: Text(
                                'I\'M ALERGIC!',
                              )
                            ),
                            SizedBox(width: 5),
                            RaisedButton(
                              color: Colors.purple,
                              onPressed: (){
                                insertdata("Amor");
                                Navigator.pop(context);
                              },
                              child: Text(
                                'ADOPT',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    );
                    });
                  },
                  child: Card(
                    child: ListTile(
                      title: Text(
                        'Amor',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                )
              ],
            )
          ),
    );
  }
}
  

