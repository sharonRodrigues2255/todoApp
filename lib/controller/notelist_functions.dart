import 'package:flutter/material.dart';
<<<<<<< HEAD
<<<<<<< HEAD
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
=======
import 'package:todoapp/model/data_model.dart';

class NoteController {
=======
import 'package:todoapp/model/data_model.dart';

class NoteController {
>>>>>>> parent of e1897f3 (integrated hive and todo finished)
  ValueNotifier<List<DataModel>> tiledata = ValueNotifier<List<DataModel>>([]);
  addItem(DataModel data) {
    tiledata.value.add(data);
    print(tiledata.value);
<<<<<<< HEAD
>>>>>>> 33bbd73227561da0fda99daad9effa3a96b3bfa4
=======
>>>>>>> parent of e1897f3 (integrated hive and todo finished)
    tiledata.notifyListeners();
  }

  deleteItem(int index) {
<<<<<<< HEAD
<<<<<<< HEAD
    mydb.delete(index);
    getItems();
=======
    final value = tiledata.value.removeAt(index);
    print(value);
    tiledata.notifyListeners();
>>>>>>> 33bbd73227561da0fda99daad9effa3a96b3bfa4
=======
    final value = tiledata.value.removeAt(index);
    print(value);
    tiledata.notifyListeners();
>>>>>>> parent of e1897f3 (integrated hive and todo finished)
  }
}
