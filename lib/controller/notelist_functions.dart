import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapp/model/data_model.dart';

class NoteController {
  var mydb = Hive.box("todoDB");

  ValueNotifier tiledata = ValueNotifier([]);

  addItem({required DataModel data}) {
    print(data.index);
    mydb.put(data.index, data);
    getItems();
  }

  getItems() async {
    tiledata.value = [];
    final data = mydb.values;
    tiledata.value.addAll(data);
    tiledata.notifyListeners();
  }

  deleteItem(int index) {
    mydb.delete(index);
    getItems();
  }
}
