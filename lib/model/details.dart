import 'package:cloud_firestore/cloud_firestore.dart';

class Detail {
  String name;
  String place;
  String imageurl;
  Timestamp dob;

  Detail.fromMap(Map<String,dynamic>data){
    name=data['name'];
    place=data['place'];
    imageurl=data['imageurl'];
    dob=data['dob'];
  }
}