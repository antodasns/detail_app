import 'dart:io';
import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker/image_picker.dart';

class AddingForm extends StatefulWidget {
  @override
  _AddingFormState createState() => _AddingFormState();
}

class _AddingFormState extends State<AddingForm> {
  DateTime selectedDate;

 File sampleImage;
 Future getImage() async{
   var tempImage = await ImagePicker.pickImage(source:ImageSource.gallery);
   setState(() {
     sampleImage=tempImage;
   });
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add"),
        centerTitle: true,
        backgroundColor: Colors.green,),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(hintText: 'Name'),
              ),
              TextFormField(
                decoration: InputDecoration(hintText: 'Place'),
              ),
              DateField(
                label:"DOB",
                selectedDate: selectedDate,
                onDateSelected: (DateTime date) {
                  setState(() {
                    selectedDate = date;
                  });
                },
                lastDate: DateTime(2020),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: RaisedButton(onPressed: () {
                  getImage();
                },
                  child: Text('Select DP'),
                  color: Colors.grey,
                ),
              ),
              RaisedButton(onPressed: () {

              },
                child: Text('Save'),
                color: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }

}



