// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:foodie/constants/constants.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        hintText: hintText,
        prefixIcon: Icon(
          icon,
          color: lightButtonColor,
        ),
        hintStyle: const TextStyle(
          color: lightButtonColor,
        ),
        fillColor: textFieldBackColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: lightButtonColor,
          ),
        ),
      ),
    );
  }
}
