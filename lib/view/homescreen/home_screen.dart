import 'package:flutter/material.dart';
import 'package:todoapp/controller/notelist_functions.dart';
import 'package:todoapp/model/data_model.dart';
import 'package:todoapp/utils/colors.dart';
import 'package:todoapp/utils/contants.dart';
import 'package:todoapp/view/homescreen/widgets/bottom_sheet.dart';
import 'package:todoapp/view/notescreen/note_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = NoteController();
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
        builder: (BuildContext context, List<DataModel> value, _) {
          return ListView.builder(
              itemCount: value.length,
              itemBuilder: (context, index) {
                final data = value[index];
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  child: InkWell(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => NoteScreen(index: index))),
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
                                        controller.deleteItem(index);
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
