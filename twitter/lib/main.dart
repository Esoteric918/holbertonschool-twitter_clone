import 'package:flutter/material.dart';
import 'package:twitter/widgets/entry_field.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: ListView(children: [
      Center(
          child: CustomEntryField(
        hint: 'Enter your email',
        controller: TextEditingController(),
      )),
      Center(
          child: CustomEntryField(
        hint: 'Enter your password',
        controller: TextEditingController(),
        isPassword: true,
      ))
    ])));
  }
}
