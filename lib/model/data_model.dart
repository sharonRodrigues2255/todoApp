import 'package:hive/hive.dart';
part 'data_model.g.dart';

@HiveType(typeId: 1)
class DataModel extends HiveObject {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final String description;

  @HiveField(2)
  final String date;

  @HiveField(3)
  final int? index;

  DataModel(
      {required this.date,
      required this.description,
      required this.title,
      this.index});

  @override
  String toString() {
    // TODO: implement toString

    return "title : $title";
  }
}
