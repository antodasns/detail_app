import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:detailapp/notifier/detail_notifier.dart';
import 'package:detailapp/model/details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:uuid/uuid.dart';


getDetails(DetailNotifier detailNotifier) async{
  QuerySnapshot snapshot= await Firestore.instance.collection('details').getDocuments();
  List<Detail> _detailList=[];
  snapshot.documents.forEach((document) {
    Detail detail = Detail.fromMap(document.data);
    _detailList.add(detail);
  });

  detailNotifier.detailList=_detailList;
}

uploadDetailAndImage(Detail detail, File localFile,DateTime selectedDate) async{
  if(localFile!=null){
  var fileExtension =path.extension(localFile.path);
   var uuid =Uuid().v4();

  final StorageReference firebaseStorageRef=FirebaseStorage.instance.ref().child("/$uuid$fileExtension");
  await firebaseStorageRef.putFile(localFile).onComplete.catchError((onError) {
    print(onError);
    return false;
  });
  String url = await firebaseStorageRef.getDownloadURL();
  _uploadDetail(detail,selectedDate, imageUrl: url);
  }
  else{
    _uploadDetail(detail,selectedDate);
  }
}

_uploadDetail(Detail detail,selectedDate, {String imageUrl}) async {
  if(imageUrl !=null) {
  CollectionReference detailRef = Firestore.instance.collection('details');
  DocumentReference documentRef = await detailRef.add(detail.toMap());
  Timestamp myTimeStamp = Timestamp.fromDate(selectedDate);
  detail.id = documentRef.documentID;
  detail.dob= myTimeStamp;
  detail.imageurl = imageUrl;
  await documentRef.setData(detail.toMap(), merge: true);
}
  else{
    CollectionReference detailRef = Firestore.instance.collection('details');
    DocumentReference documentRef = await detailRef.add(detail.toMap());
    Timestamp myTimeStamp = Timestamp.fromDate(selectedDate);
    detail.id = documentRef.documentID;
    detail.dob= myTimeStamp;
    detail.imageurl = "https://firebasestorage.googleapis.com/v0/b/detailapp-6bb92.appspot.com/o/hd_dp.jpg?alt=media&token=3517307e-3540-4e27-af3a-18b7c393e05f";
    await documentRef.setData(detail.toMap(), merge: true);
  }
}

editDetailAndImage(Detail detail, File localFile,DateTime selectedDate) async{
  if(localFile!=null){
    var fileExtension =path.extension(localFile.path);
    var uuid =Uuid().v4();

    final StorageReference firebaseStorageRef=FirebaseStorage.instance.ref().child("/$uuid$fileExtension");
    await firebaseStorageRef.putFile(localFile).onComplete.catchError((onError) {
      print(onError);
      return false;
    });
    String url = await firebaseStorageRef.getDownloadURL();
    _editDetail(detail,selectedDate, imageUrl: url);
  }
  else{
    _editDetail(detail,selectedDate);
  }
}

_editDetail(Detail detail,selectedDate, {String imageUrl}) async {
  if(imageUrl !=null) {
    CollectionReference detailRef = Firestore.instance.collection('details');
    Timestamp myTimeStamp = Timestamp.fromDate(selectedDate);
    detail.dob = myTimeStamp;
    detail.imageurl = imageUrl;
    await detailRef.document(detail.id).updateData(detail.toMap());
  }
  else{
    CollectionReference detailRef = Firestore.instance.collection('details');
    Timestamp myTimeStamp = Timestamp.fromDate(selectedDate);
    detail.dob = myTimeStamp;
    await detailRef.document(detail.id).updateData(detail.toMap());
  }
}


deleteDetail(Detail detail) async {

  await Firestore.instance.collection('details').document(detail.id).delete();

}