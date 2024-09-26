// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:foodie/constants/constants.dart';
import 'package:foodie/widgets/info_text.dart';

class PrimaryButton extends StatelessWidget {
  final String buttonText;
  final Function()? onTap;
  const PrimaryButton({
    super.key,
    required this.buttonText,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
            color: primaryButtonColor,
            borderRadius: BorderRadius.circular(
              60,
            )),
        child: Center(
          child: InfoText(
            text: buttonText,
            color: darkTextColor,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
