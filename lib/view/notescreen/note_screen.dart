import 'package:flutter/material.dart';
import 'package:todoapp/utils/colors.dart';
import 'package:todoapp/utils/contants.dart';
import 'package:todoapp/view/homescreen/home_screen.dart';

class NoteScreen extends StatelessWidget {
  const NoteScreen({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorContants.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: Text(
          tiledata[index]["title"]!,
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
                  tiledata[index]["date"]!,
                  style: TextStyle(color: Colors.white),
                ),
                kwidth20,
                kwidth20,
              ],
            ),
            kwidth20,
            Expanded(
              child: Text(
                tiledata[index]["desc"]!,
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
