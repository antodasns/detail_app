import 'dart:collection';
import 'package:provider/provider.dart';
import 'package:detailapp/model/details.dart';
import 'package:flutter/cupertino.dart';

class DetailNotifier with ChangeNotifier{
  List<Detail>_detailList=[];
  Detail _currentUser;

  UnmodifiableListView<Detail> get detailList =>  UnmodifiableListView(_detailList);
  Detail get currentUser => _currentUser;

  set detailList(List<Detail> detailList){
    _detailList=detailList;
    notifyListeners();
  }

  set currentUser(Detail detail){
    _currentUser = detail;
    notifyListeners();
  }
}