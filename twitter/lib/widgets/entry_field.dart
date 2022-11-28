import 'package:flutter/material.dart';

class CustomEntryField extends StatelessWidget {
  final String hint;
  final bool isPassword;
  final TextEditingController controller;
  // set attributes: hint: string, controller: TextEditingController, isPassword: bool
  const CustomEntryField({
    super.key,
    this.hint = 'delfault',
    this.isPassword = false,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: TextField(
          controller: controller,
          obscureText: isPassword,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey.shade300,
            focusColor: Colors.lightBlue,
            // hoverColor: Colors.purple,
            hintText: hint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
      );
}
