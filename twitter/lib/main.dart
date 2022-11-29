import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:twitter/screens/signin_screen.dart';
// import 'package:twitter/widgets/entry_field.dart';
// import 'package:twitter/widgets/flat_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          button: GoogleFonts.mulish(
            color: Colors.blue.shade300,
            fontSize: 18,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      home: const SignIn(),
    );
  }
}
