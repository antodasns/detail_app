import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:detailapp/notifier/detail_notifier.dart';
import 'package:detailapp/model/details.dart';
import 'package:detailapp/api/detail_api.dart';

class DetailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DetailNotifier detailNotifier = Provider.of<DetailNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                radius: 40.0,
                backgroundImage: AssetImage('assets/thumb.jpg'),
              ),
            ),
            Divider(
              color: Colors.grey[800],
              height: 60.0,
            ),
            Text(
              'NAME',
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              detailNotifier.currentUser.name,
              style: TextStyle(
                color: Colors.brown,
                fontWeight: FontWeight.bold,
                fontSize: 28.0,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(height: 30.0),
            Text(
              'Place',
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              detailNotifier.currentUser.place,
              style: TextStyle(
                color: Colors.brown,
                fontWeight: FontWeight.bold,
                fontSize: 28.0,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(height: 30.0),
            Text(
              'DOB',
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              detailNotifier.currentUser.dob,
              style: TextStyle(
                color: Colors.brown,
                fontWeight: FontWeight.bold,
                fontSize: 28.0,
                letterSpacing: 2.0,
              ),
            )

          ],
        ),
      ),
    );
  }
}



