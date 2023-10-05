import 'package:flutter/material.dart';
import 'package:todoapp/utils/colors.dart';
import 'package:todoapp/utils/contants.dart';
import 'package:todoapp/view/homescreen/widgets/bottom_sheet.dart';

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
        return BottomSheetWidget(
            titlleController: titlleController,
            descriptioncontroller: descriptioncontroller,
            dateController: dateController);
      });
}
