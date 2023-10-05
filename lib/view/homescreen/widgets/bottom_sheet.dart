import 'package:flutter/material.dart';
import 'package:todoapp/utils/colors.dart';
import 'package:todoapp/utils/contants.dart';
import 'package:todoapp/view/homescreen/home_screen.dart';

class BottomSheetWidget extends StatefulWidget {
  const BottomSheetWidget({
    super.key,
    required this.titlleController,
    required this.descriptioncontroller,
    required this.dateController,
  });

  final TextEditingController titlleController;
  final TextEditingController descriptioncontroller;
  final TextEditingController dateController;

  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  @override
  Widget build(BuildContext context) {
    late DateTime selectedDate;
    bool isSelected = false;
    return Container(
      decoration: BoxDecoration(
          color: ColorContants.bottomSheetColor,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30))),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            kheight20,
            TextFormField(
              controller: widget.titlleController,
              decoration: InputDecoration(
                  hintText: "Title",
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
            kheight10,
            TextFormField(
              controller: widget.descriptioncontroller,
              maxLines: 5,
              decoration: InputDecoration(
                  hintText: "Description",
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
            kheight10,
            TextFormField(
              controller: widget.dateController,
              readOnly: true,
              decoration: InputDecoration(
                  prefixIcon: InkWell(
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate:
                                isSelected ? selectedDate : DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime.now().add(Duration(days: 120)));

                        if (pickedDate != null) {
                          setState(() {
                            selectedDate = pickedDate;
                            isSelected = true;
                            final year = pickedDate.year;
                            final month = pickedDate.month;
                            final day = pickedDate.day;
                            widget.dateController.text = "$year-$month-$day";
                          });
                        }
                      },
                      child: Icon(Icons.calendar_month)),
                  hintText: "date",
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
            kheight20,
            ElevatedButton(
              onPressed: () {
                final Map<String, String> map = {};
                setState(() {
                  map["title"] = widget.titlleController.text;
                  map["desc"] = widget.descriptioncontroller.text;
                  map["date"] = widget.dateController.text;
                  tiledata.add(map);
                });
                Navigator.pop(context);
              },
              child: Text("Add"),
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.blue)),
            )
          ],
        ),
      ),
    );
  }
}
