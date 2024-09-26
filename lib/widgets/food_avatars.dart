// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:foodie/constants/constants.dart';
import 'package:foodie/data/data.dart';
import 'package:foodie/widgets/title_text.dart';

class FoodAvatars extends StatelessWidget {
  const FoodAvatars({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: foodList.length,
      itemBuilder: (context, index) => Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                fit: BoxFit.contain,
                foodList[index]['imagePath'],
                height: 80,
                width: 80,
              ),
            ),
            const SizedBox(height: 5),
            TitleText(
              text: foodList[index]['name'],
              color: lightButtonColor,
              fontSize: 15,
            ),
          ],
        ),
      ),
    );
  }
}
