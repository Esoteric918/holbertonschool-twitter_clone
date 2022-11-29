import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomFlatButton extends StatelessWidget {
  final String label;
  final Function onPressed;

  const CustomFlatButton({
    super.key,
    this.label = 'Submit',
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) => Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: FloatingActionButton.extended(
        onPressed: () => onPressed(),
        elevation: 0,
        label: Text(
          label,
          style: Theme.of(context).textTheme.button!.copyWith(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w800,
                fontFamily: GoogleFonts.mulish().fontFamily,
              ),
        ),
      ));
}
