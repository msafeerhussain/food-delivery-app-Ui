import 'package:flutter/material.dart';
import 'package:foodie/constants/constants.dart';
import 'package:foodie/screens/login_screen.dart';
import 'package:foodie/screens/register_screen.dart';
import 'package:foodie/widgets/primary_button.dart';
import 'package:foodie/widgets/scroll_widget.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';

class ScrollScreen extends StatefulWidget {
  const ScrollScreen({super.key});

  @override
  State<ScrollScreen> createState() => _ScrollScreenState();
}

class _ScrollScreenState extends State<ScrollScreen> {
  List<Map<String, String>> scrollItems = [
    {
      'title': 'Order for Food',
      'subTitle': loremIpsum(words: 20),
      'imagePath': 'assets/images/scroll_1.svg'
    },
    {
      'title': 'Secure Payment',
      'subTitle': loremIpsum(words: 20),
      'imagePath': 'assets/images/scroll_2.svg'
    },
    {
      'title': 'Fast Delivery',
      'subTitle': loremIpsum(words: 20),
      'imagePath': 'assets/images/scroll_3.svg'
    },
  ];
  int scrollIndex = 0;

  void nextButton() {
    if (scrollIndex < 2) {
      setState(() {
        scrollIndex++;
      });
    } else {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RegisterScreen(),
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              Expanded(
                flex: 6,
                child: ScrollWidget(
                    imagePath: scrollItems[scrollIndex]['imagePath']!,
                    title: scrollItems[scrollIndex]['title']!,
                    subTitle: scrollItems[scrollIndex]['subTitle']!),
              ),
              Expanded(child: indicatorWidget()),
              Expanded(
                child: Column(
                  children: [
                    PrimaryButton(
                      buttonText: "Next",
                      onTap: nextButton,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row indicatorWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: List.generate(
            scrollItems.length,
            (index) => Container(
              margin: const EdgeInsets.all(2),
              width: scrollIndex == index ? 30 : 5,
              height: 5,
              decoration: BoxDecoration(
                color: scrollIndex == index
                    ? secondaryTextColor
                    : lightButtonColor,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
