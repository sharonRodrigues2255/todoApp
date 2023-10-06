import 'package:flutter/material.dart';
import 'package:todoapp/model/data_model.dart';
import 'package:todoapp/utils/colors.dart';
import 'package:todoapp/utils/contants.dart';

showAddBottomSheet(
  BuildContext context,
  Function addttle,
) {
  TextEditingController titlleController = TextEditingController();
  TextEditingController descriptioncontroller = TextEditingController();
  TextEditingController dateController = TextEditingController();

  return showModalBottomSheet(
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, inSetState) {
          late DateTime selectedDate;
          bool isSelected = false;
          return Container(
            decoration: BoxDecoration(
                color: ColorContants.bottomSheetColor,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30))),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  kheight20,
                  TextFormField(
                    controller: titlleController,
                    decoration: InputDecoration(
                        hintText: "Title",
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                  kheight10,
                  TextFormField(
                    controller: descriptioncontroller,
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
                    controller: dateController,
                    readOnly: true,
                    decoration: InputDecoration(
                        prefixIcon: InkWell(
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: isSelected
                                      ? selectedDate
                                      : DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate:
                                      DateTime.now().add(Duration(days: 120)));

                              if (pickedDate != null) {
                                selectedDate = pickedDate;
                                isSelected = true;
                                final year = pickedDate.year;
                                final month = pickedDate.month;
                                final day = pickedDate.day;
                                dateController.text = "$year-$month-$day";
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
                      addttle(DataModel(
                          date: dateController.text,
                          description: descriptioncontroller.text,
                          title: titlleController.text));

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
        });
      });
}
