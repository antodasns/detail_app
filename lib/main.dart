import 'package:flutter/material.dart';
import 'package:detailapp/screens/addingform.dart';
import 'package:detailapp/screens/editingform.dart';
import 'package:detailapp/screens/detailview.dart';
import 'package:detailapp/screens/home_list.dart';

void main() => runApp(DetailApp());

class DetailApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/homelist",
      routes: {
        "/homelist":(context) => HomeList(),
        "/addform":(context) => AddingForm(),
        "/editform":(context) => EditingForm(),
        "/details":(context) => DetailView(),
      },
    );
  }
}

