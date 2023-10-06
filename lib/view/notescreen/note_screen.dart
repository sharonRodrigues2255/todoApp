import 'package:flutter/material.dart';
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
    return Scaffold(
      backgroundColor: ColorContants.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: Text(
          title,
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
                  "Date : $date",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            kwidth20,
            Expanded(
              child: Text(
                description,
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            )
          ],
        ),
      ),
    );
  }
}
