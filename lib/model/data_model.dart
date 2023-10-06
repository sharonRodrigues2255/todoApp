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
      {required this.date, required this.description, required this.title});

  @override
  String toString() {
    // TODO: implement toString

    return "title : $title";
  }
}
