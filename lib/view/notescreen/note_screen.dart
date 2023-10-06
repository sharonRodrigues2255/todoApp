import 'package:flutter/material.dart';
import 'package:todoapp/controller/notelist_functions.dart';
import 'package:todoapp/utils/colors.dart';
import 'package:todoapp/utils/contants.dart';

class NoteScreen extends StatelessWidget {
  const NoteScreen(
      {super.key,
      required this.title,
      required this.description,
      required this.date});
  final String title;
  final String description;
  final String date;
  @override
  Widget build(BuildContext context) {
    final controller = NoteController();
    return Scaffold(
      backgroundColor: ColorContants.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: Text(
<<<<<<< HEAD
          title,
=======
          controller.tiledata.value[index].title,
>>>>>>> 33bbd73227561da0fda99daad9effa3a96b3bfa4
          style: TextStyle(fontSize: 30),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Spacer(),
                Text(
<<<<<<< HEAD
                  "Date : $date",
=======
                  controller.tiledata.value[index].date,
>>>>>>> 33bbd73227561da0fda99daad9effa3a96b3bfa4
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            kwidth20,
            Expanded(
              child: Text(
<<<<<<< HEAD
                description,
                style: TextStyle(color: Colors.white, fontSize: 18),
=======
                controller.tiledata.value[index].description,
                style: TextStyle(color: Colors.white),
>>>>>>> 33bbd73227561da0fda99daad9effa3a96b3bfa4
              ),
            )
          ],
        ),
      ),
    );
  }
}
