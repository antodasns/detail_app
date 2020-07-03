import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:detailapp/notifier/detail_notifier.dart';
import 'package:detailapp/model/details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


getDetails(DetailNotifier detailNotifier) async{
  QuerySnapshot snapshot= await Firestore.instance.collection('details').getDocuments();
  List<Detail> _detailList=[];
  snapshot.documents.forEach((document) {
    Detail detail = Detail.fromMap(document.data);
    _detailList.add(detail);
  });

  detailNotifier.detailList=_detailList;
}