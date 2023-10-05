import 'package:flutter/material.dart';
import 'package:todoapp/utils/colors.dart';
import 'package:todoapp/view/homescreen/widgets/bottom_sheet.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
      ),
      backgroundColor: ColorContants.backgroundColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showBottomSheet(context);
        },
        backgroundColor: Colors.red,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        shape: CircleBorder(),
      ),
    );
  }
}

showBottomSheet(BuildContext context) {
  TextEditingController titlleController = TextEditingController();
  TextEditingController descriptioncontroller = TextEditingController();
  TextEditingController dateController = TextEditingController();
  return showModalBottomSheet(
      context: context,
      builder: (context) {
        return BottomSheetWidget(
            titlleController: titlleController,
            descriptioncontroller: descriptioncontroller,
            dateController: dateController);
      });
}
