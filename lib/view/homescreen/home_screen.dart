import 'package:flutter/material.dart';
import 'package:todoapp/controller/notelist_functions.dart';
<<<<<<< HEAD
<<<<<<< HEAD
=======
import 'package:todoapp/model/data_model.dart';
>>>>>>> 33bbd73227561da0fda99daad9effa3a96b3bfa4
=======
import 'package:todoapp/model/data_model.dart';
>>>>>>> parent of e1897f3 (integrated hive and todo finished)
import 'package:todoapp/utils/colors.dart';
import 'package:todoapp/utils/contants.dart';
import 'package:todoapp/view/homescreen/widgets/bottom_sheet.dart';
import 'package:todoapp/view/notescreen/note_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = NoteController();
<<<<<<< HEAD
<<<<<<< HEAD
    controller.getItems();
=======
>>>>>>> 33bbd73227561da0fda99daad9effa3a96b3bfa4
=======
>>>>>>> parent of e1897f3 (integrated hive and todo finished)
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
          showAddBottomSheet(context, controller.addItem);
        },
        backgroundColor: Colors.red,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        shape: CircleBorder(),
      ),
      body: ValueListenableBuilder(
        valueListenable: controller.tiledata,
<<<<<<< HEAD
<<<<<<< HEAD
        builder: (BuildContext context, value, _) {
=======
        builder: (BuildContext context, List<DataModel> value, _) {
>>>>>>> 33bbd73227561da0fda99daad9effa3a96b3bfa4
=======
        builder: (BuildContext context, List<DataModel> value, _) {
>>>>>>> parent of e1897f3 (integrated hive and todo finished)
          return ListView.builder(
              itemCount: value.length,
              itemBuilder: (context, index) {
                final data = value[index];
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  child: InkWell(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
<<<<<<< HEAD
                        builder: (context) => NoteScreen(
                            title: data.title,
                            description: data.description,
                            date: data.date))),
=======
                        builder: (context) => NoteScreen(index: index))),
>>>>>>> 33bbd73227561da0fda99daad9effa3a96b3bfa4
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.green,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 220,
                                        child: Text(
                                          data.title,
                                          style: TextStyle(
                                              fontSize: 40,
                                              overflow: TextOverflow.ellipsis),
                                        ),
                                      ),
                                      Container(
                                        width: 220,
                                        child: Text(
                                          data.description,
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
<<<<<<< HEAD
<<<<<<< HEAD
                                        controller.deleteItem(data.index);
=======
                                        controller.deleteItem(index);
>>>>>>> 33bbd73227561da0fda99daad9effa3a96b3bfa4
=======
                                        controller.deleteItem(index);
>>>>>>> parent of e1897f3 (integrated hive and todo finished)
                                      },
                                      child: Icon(Icons.delete))
                                ],
                              ),
                              Row(
                                children: [
                                  Spacer(),
                                  Text(
                                    data.date,
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
              });
        },
      ),
    );
  }
}
