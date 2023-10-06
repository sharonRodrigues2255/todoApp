class DataModel {
  final String title;
  final String description;
  final String date;

  DataModel(
      {required this.date, required this.description, required this.title});

  @override
  String toString() {
    // TODO: implement toString

    return "title : $title";
  }
}
