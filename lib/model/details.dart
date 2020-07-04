import 'package:cloud_firestore/cloud_firestore.dart';

class Detail {
  String id;
  String name;
  String place;
  String imageurl;
  Timestamp dob;

  Detail();
  Detail.fromMap(Map<String,dynamic>data){
    id=data['id'];
    name=data['name'];
    place=data['place'];
    imageurl=data['imageurl'];
    dob=data['dob'];
  }

  Map<String, dynamic> toMap(){
    return{
      'id':id,
      'name':name,
      'place':place,
      'imageurl':imageurl,
      'dob':dob
    };
  }
}