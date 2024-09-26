// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:foodie/constants/constants.dart';
import 'package:foodie/widgets/info_text.dart';
import 'package:foodie/widgets/title_text.dart';

class ScrollWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subTitle;
  const ScrollWidget({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subTitle,
  });

  get scrollItems => null;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const SizedBox(),
        SvgPicture.asset(imagePath, height: 300, width: 300),
        TitleText(
          text: title,
          fontSize: 35,
          color: primaryTextColor,
        ),
        InfoText(
          text: subTitle,
          color: lightButtonColor,
          fontSize: 15,
        ),
      ],
    );
  }
}
