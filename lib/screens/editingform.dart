import 'dart:io';
import 'package:detailapp/api/detail_api.dart';
import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';
import 'package:image_picker/image_picker.dart';
import 'package:detailapp/model/details.dart';
import 'package:detailapp/notifier/detail_notifier.dart';
import 'package:provider/provider.dart';


class EditingForm extends StatefulWidget {
  @override
  _AddingFormState createState() => _AddingFormState();
}

class _AddingFormState extends State<EditingForm> {
  void editedContent(BuildContext context)//popup box
  {
    var alertDialog = AlertDialog(
      backgroundColor:Colors.grey,
      title:Text("Updated",
      ),
      content:Text("Your Details has been Updated",
      ),
    );
    showDialog(
        context:context,
        builder:(BuildContext context)=>alertDialog
    );
  }
  File _imageFile;
  getImage() async{
    File imageFile =
    await ImagePicker.pickImage(source: ImageSource.gallery, imageQuality: 50, maxWidth: 400);
    setState(() {
      _imageFile = imageFile;
    });
  }
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Detail _currentUser;

  void initState() {
    super.initState();
    DetailNotifier detailNotifier = Provider.of<DetailNotifier>(context, listen: false);
    if (detailNotifier.currentUser != null){
      _currentUser=detailNotifier.currentUser;
    }else{
      _currentUser= Detail();
    }
  }

  @override
  Widget build(BuildContext context) {

    DetailNotifier detailNotifier = Provider.of<DetailNotifier>(context, listen: false);
    DateTime selectedDate = DateTime.parse(detailNotifier.currentUser.dob.toDate().toString());
    return Scaffold(
      appBar: AppBar(
        title: Text("Add"),
        centerTitle: true,
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: Icon(Icons.home),
          color: Colors.white,
          onPressed: (){
            Navigator.pushReplacementNamed(context, '/homelist');
          },
        ),),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key:_formKey,
          autovalidate: true,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(hintText: 'Name'),
                initialValue: _currentUser.name,
                onSaved: (String value) {
                  _currentUser.name=value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(hintText: 'Place'),
                initialValue: _currentUser.place,
                onSaved: (String value) {
                  _currentUser.place=value;
                },
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
                _formKey.currentState.save();
                editDetailAndImage(_currentUser,_imageFile,selectedDate);
                Navigator.pushReplacementNamed(context, '/homelist');
                editedContent(context);
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



