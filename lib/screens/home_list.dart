import 'package:flutter/material.dart';

class HomeList extends StatefulWidget {
  @override
  _HomeListState createState() => _HomeListState();
}

class _HomeListState extends State<HomeList> {
  Widget userListing(){
    return Column(
      children: <Widget>[
        Card(
          margin: EdgeInsets.all(10),
          color:Colors.blueGrey[100],
          child:Padding(
            padding: EdgeInsets.all(16.0),

            child: Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        title: Container(
                          child: Text("Anto Das",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color:Colors.black,
                            ),

                          ),
                        ),
                        onTap: (){
                          Navigator.pushReplacementNamed(context, '/details');
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10.0),
                RaisedButton.icon(onPressed: () {
                  Navigator.pushReplacementNamed(context, '/editform');
                },
                  icon: Icon(Icons.edit),
                  label: Text('Edit'),
                  color: Colors.blueAccent,
                ),
                SizedBox(width: 6.0),
                RaisedButton.icon(onPressed: () {

                },
                  icon: Icon(Icons.delete),
                  label: Text('Delete'),
                  color: Colors.red,
                ),
              ],
            ),
          ) ,
        ),
        Card(
          margin: EdgeInsets.all(10),
          color:Colors.blueGrey[100],
          child:Padding(
            padding: EdgeInsets.all(16.0),

            child: Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        title: Container(
                          child: Text("Mohan Lal",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color:Colors.black,
                            ),

                          ),
                        ),
                        onTap: (){

                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10.0),
                RaisedButton.icon(onPressed: () {
                  Navigator.pushReplacementNamed(context, '/editform');
                },
                  icon: Icon(Icons.edit),
                  label: Text('Edit'),
                  color: Colors.blueAccent,
                ),
                SizedBox(width: 6.0),
                RaisedButton.icon(onPressed: () {
                },
                  icon: Icon(Icons.delete),
                  label: Text('Delete'),
                  color: Colors.red,
                ),
              ],
            ),
          ) ,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listing'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: userListing(),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: (){
          Navigator.pushReplacementNamed(context, '/addform');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
