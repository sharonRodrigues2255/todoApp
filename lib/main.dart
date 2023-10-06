import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
<<<<<<< HEAD
<<<<<<< HEAD
import 'package:todoapp/model/data_model.dart';
=======
>>>>>>> parent of e1897f3 (integrated hive and todo finished)
import 'package:todoapp/view/homescreen/home_screen.dart';

void main() async {
  await Hive.initFlutter();
<<<<<<< HEAD

  if (!Hive.isAdapterRegistered(1)) {
    Hive.registerAdapter<DataModel>(DataModelAdapter());
  } else {
    return;
  }

  var box = await Hive.openBox("todoDB");
=======
import 'package:todoapp/view/homescreen/home_screen.dart';

void main() async {
>>>>>>> 33bbd73227561da0fda99daad9effa3a96b3bfa4
=======
  var box = Hive.openBox("todoDB");
>>>>>>> parent of e1897f3 (integrated hive and todo finished)
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
