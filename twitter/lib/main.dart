import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:twitter/widgets/entry_field.dart';
import 'package:twitter/widgets/flat_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Spitter'),
              titleTextStyle: const TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.w800,
              ),
            ),
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
              )),
              Center(
                child: CustomFlatButton(
                  label: 'Submit',
                  onPressed: () {},
                ),
              ),
              Center(
                child: Text(
                  'Forgot Password?',
                  style: GoogleFonts.mulish(
                    color: Colors.blue,
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ])));
  }
}
