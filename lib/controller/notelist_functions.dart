import 'package:flutter/material.dart';
import 'package:todoapp/model/data_model.dart';

class NoteController {
  ValueNotifier<List<DataModel>> tiledata = ValueNotifier<List<DataModel>>([]);
  addItem(DataModel data) {
    tiledata.value.add(data);
    print(tiledata.value);
    tiledata.notifyListeners();
  }

  deleteItem(int index) {
    final value = tiledata.value.removeAt(index);
    print(value);
    tiledata.notifyListeners();
  }
}
