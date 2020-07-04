import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:detailapp/notifier/detail_notifier.dart';
import 'package:detailapp/model/details.dart';
import 'package:detailapp/api/detail_api.dart';
import 'package:detailapp/screens/addingform.dart';

class HomeList extends StatefulWidget {
  @override
  _HomeListState createState() => _HomeListState();
}
void deleteContent(BuildContext context)//popup box
{
  var alertDialog = AlertDialog(
    backgroundColor:Colors.grey,
    title:Text("Deleted",
    ),
    content:Text("Your Details has been Deleted",
    ),
  );
  showDialog(
      context:context,
      builder:(BuildContext context)=>alertDialog
  );
}
class _HomeListState extends State<HomeList> {
  var refreshKey = GlobalKey<RefreshIndicatorState>();
  Widget userListing(){
    return RefreshIndicator(
      key: refreshKey,
      onRefresh: refreshList,
      child: ListView.builder(
        itemCount: 1,
        itemBuilder: (context,index){
         return Consumer<DetailNotifier>(
           builder:(context,x,child){
             return Column(
               children: <Widget>[for(Detail y in x.detailList)
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
                                   child: Text(y.name,
                                     style: TextStyle(
                                       fontSize: 20.0,
                                       fontWeight: FontWeight.bold,
                                       color:Colors.black,
                                     ),

                                   ),
                                 ),
                                 onTap: (){
                                   x.currentUser = y;

                                   Navigator.pushNamed(context, '/details');

                                 },
                               ),
                             ],
                           ),
                         ),
                         SizedBox(width: 10.0),
                         RaisedButton.icon(onPressed: () {
                           x.currentUser = y;
                           Navigator.pushNamed(context, '/editform');
                         },
                           icon: Icon(Icons.edit),
                           label: Text('Edit'),
                           color: Colors.blueAccent,
                         ),
                         SizedBox(width: 6.0),
                         RaisedButton.icon(onPressed: () {
                           deleteDetail(y);

                           Navigator.pushNamed(context, '/homelist');
                           deleteContent(context);
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
           },
         );
        },
      ),
    );
  }

  void initState() {
    DetailNotifier detailNotifier = Provider.of<DetailNotifier>(context, listen: false);
    getDetails(detailNotifier);
    super.initState();
    refreshList();
  }
  Future<Null> refreshList() async {
    DetailNotifier detailNotifier = Provider.of<DetailNotifier>(context, listen: false);
    getDetails(detailNotifier);
    refreshKey.currentState?.show(atTop: false);
    await Future.delayed(Duration(seconds: 2));
  }
  @override
  Widget build(BuildContext context) {
    DetailNotifier detailNotifier = Provider.of<DetailNotifier>(context);
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
          Navigator.pushNamed(context, '/addform');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
