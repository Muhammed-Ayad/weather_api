import 'package:flutter/material.dart';
import '../screens/my_home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: ' Weather app',
      theme: ThemeData(
        primaryColor: Colors.teal,
      ),
      home: MyHomePage(),
    );
  }
}
