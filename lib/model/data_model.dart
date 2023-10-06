import 'package:hive/hive.dart';

@HiveType(typeId: 1)
class DataModel {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final String description;

  @HiveField(2)
  final String date;

  DataModel(
<<<<<<< HEAD
<<<<<<< HEAD
      {required this.date,
      required this.description,
      required this.title,
      this.index});
=======
      {required this.date, required this.description, required this.title});
>>>>>>> 33bbd73227561da0fda99daad9effa3a96b3bfa4
=======
      {required this.date, required this.description, required this.title});
>>>>>>> parent of e1897f3 (integrated hive and todo finished)

  @override
  String toString() {
    // TODO: implement toString

    return "title : $title";
  }
}
