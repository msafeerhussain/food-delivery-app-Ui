import 'package:flutter/material.dart';
import 'package:foodie/constants/constants.dart';
import 'package:foodie/screens/scroll_screen.dart';
import 'package:foodie/widgets/info_text.dart';
import 'package:foodie/widgets/title_text.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage('assets/images/image1.png'),
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black,
                    Colors.black.withOpacity(0.05),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
          ),
          Positioned.fill(
            top: MediaQuery.of(context).size.height * 0.3,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  titleArea(),
                  const SizedBox(height: 60),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      startButton(context),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget startButton(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ScrollScreen(),
            ));
      },
      child: Container(
        height: 60,
        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 6),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            bottomLeft: Radius.circular(50),
          ),
          color: secondaryTextColor,
        ),
        child: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: secondaryTextColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 3,
                    spreadRadius: 3,
                  ),
                ],
                border: Border.all(
                  color: lightButtonColor,
                ),
              ),
              child: const Icon(
                Icons.arrow_forward_ios_sharp,
                color: darkTextColor,
              ),
            ),
            const SizedBox(width: 10),
            const TitleText(
                text: "Get Started...", fontSize: 16, color: darkTextColor),
          ],
        ),
      ),
    );
  }

  Padding titleArea() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const TitleText(
            text: "Welcome to\nFoodies",
            color: secondaryTextColor,
            isCentered: true,
            fontSize: 45,
          ),
          InfoText(
            text: loremIpsum(words: 20),
            color: lightButtonColor,
            fontSize: 14,
          ),
        ],
      ),
    );
  }
}
