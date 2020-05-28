import 'package:cats/services/database.dart';
import 'package:flutter/material.dart';


import '../cat.dart';

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

    List<Cat> cats = [
      Cat(name: 'Niko', desc: 'The SEXIEST cat alive!!!!',image: 'assets/niko.jpeg'),
      Cat(name: 'Ano', desc:'The only kitten in the family',image:'assets/ano.jpeg'),
      Cat(name: 'Takong', desc: 'He is a fierce, yet an adorable cat!', image:'assets/takong.jpg'),
      Cat(name: 'Amor', desc: 'She is a good cat. She loves to be pet by the owner',image: 'assets/amor.jpeg')
    ];

  Widget catTemplate(cat){
    return GestureDetector(
      onTap: () {
        showDialog(context: context,
        builder: (context){
          return AlertDialog(
            title: Text(cat.name),
            content: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(cat.image),
                    SizedBox(height: 8),
                    Text(
                      cat.desc,
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
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
                    child: Text(
                      'I\'M ALLERGIC'
                    ),
                  ),
                  SizedBox(height: 5),
                  RaisedButton(
                    onPressed: () {
                      insertdata(cat.name);
                      Navigator.pop(context);
                    },
                    color: Colors.purple,
                    child: Text('ADOPT'),
                  )
                ],
              )
            ],
          );
        }
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              cat.name,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: cats.map((cat) => catTemplate(cat)).toList(),
          ),
        ),
      )
    );
  }
}
  
