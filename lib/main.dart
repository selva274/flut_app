import 'package:flut_app/display.dart';
import 'package:flut_app/dpHelper/mongodb.dart';
import 'package:flut_app/update.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MongodbDatabase.connect();
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MongodbUpdate(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("MongoDb"),
        ),
        body: SafeArea(
          child: Text('Good Morning'),
        ));
  }
}
