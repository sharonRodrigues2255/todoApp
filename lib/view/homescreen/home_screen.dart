import 'package:flutter/material.dart';
import 'package:todoapp/utils/colors.dart';
import 'package:todoapp/utils/contants.dart';
import 'package:todoapp/view/notescreen/note_screen.dart';

List<Map<String, String>> tiledata = [];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: Text(
          "Todo",
          style: TextStyle(fontSize: 30),
        ),
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
      body: ListView.builder(
          itemCount: tiledata.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              child: InkWell(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => NoteScreen(index: index))),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: index % 2 == 0 ? Colors.green : Colors.blue[50],
                  ),
                  width: double.infinity,
                  height: 150,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 220,
                                    child: Text(
                                      tiledata[index]["title"]!,
                                      style: TextStyle(
                                          fontSize: 40,
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                  ),
                                  Container(
                                    width: 220,
                                    child: Text(
                                      tiledata[index]["desc"]!,
                                      style: TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          fontSize: 20),
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              InkWell(
                                  onTap: () {
                                    tiledata.removeAt(index);
                                    setState(() {});
                                  },
                                  child: Icon(Icons.delete))
                            ],
                          ),
                          Row(
                            children: [
                              Spacer(),
                              Text(
                                tiledata[index]["date"]!,
                              ),
                              kwidth10
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
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
                      final Map<String, String> map = {};

                      map["title"] = titlleController.text;
                      map["desc"] = descriptioncontroller.text;
                      map["date"] = dateController.text;
                      tiledata.add(map);

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
