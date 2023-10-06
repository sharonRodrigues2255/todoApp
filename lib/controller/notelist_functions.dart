import 'package:flutter/material.dart';
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
  ValueNotifier<List<DataModel>> tiledata = ValueNotifier<List<DataModel>>([]);
  addItem(DataModel data) {
    tiledata.value.add(data);
    print(tiledata.value);
>>>>>>> 33bbd73227561da0fda99daad9effa3a96b3bfa4
    tiledata.notifyListeners();
  }

  deleteItem(int index) {
<<<<<<< HEAD
    mydb.delete(index);
    getItems();
=======
    final value = tiledata.value.removeAt(index);
    print(value);
    tiledata.notifyListeners();
>>>>>>> 33bbd73227561da0fda99daad9effa3a96b3bfa4
  }
}
