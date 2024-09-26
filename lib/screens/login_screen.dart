import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodie/constants/constants.dart';
import 'package:foodie/screens/home_page.dart';
import 'package:foodie/screens/register_screen.dart';
import 'package:foodie/widgets/custom_text_field.dart';
import 'package:foodie/widgets/info_text.dart';
import 'package:foodie/widgets/primary_button.dart';
import 'package:foodie/widgets/title_text.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(),
              const SizedBox(),
              SvgPicture.asset(
                'assets/images/login.svg',
                height: 250,
                width: 250,
              ),
              const TitleText(
                  text: "Log in", fontSize: 25, color: primaryTextColor),
              const Column(
                children: [
                  CustomTextField(
                      hintText: "Enter your phone", icon: Icons.phone),
                  SizedBox(height: 20),
                  CustomTextField(
                      hintText: "Enter your password",
                      icon: Icons.lock_outline_rounded),
                ],
              ),
              PrimaryButton(
                buttonText: "Sign in",
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ));
                },
              ),
              seperator(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  authButton(
                    imagePath: "assets/images/facebook.png",
                  ),
                  authButton(
                    imagePath: "assets/images/google.png",
                  ),
                  authButton(
                    imagePath: "assets/images/apple.png",
                  ),
                ],
              ),
              const SizedBox(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InfoText(
                      text: "Create a new account > ",
                      color: primaryTextColor,
                      fontSize: 15),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterScreen()));
                    },
                    child: InfoText(
                        text: "Sign Up",
                        color: secondaryTextColor,
                        fontSize: 15),
                  ),
                ],
              ),
              const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }

  Container authButton({required String imagePath}) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: textFieldBackColor,
      ),
      child: Image.asset(
        height: 40,
        width: 40,
        fit: BoxFit.contain,
        imagePath,
      ),
    );
  }

  Row seperator() {
    return Row(
      children: [
        Expanded(child: divider()),
        const SizedBox(width: 15),
        const TitleText(text: "or", fontSize: 15, color: lightButtonColor),
        const SizedBox(width: 15),
        Expanded(child: divider()),
      ],
    );
  }

  Container divider() {
    return Container(
      height: 0.6,
      decoration: BoxDecoration(
        color: lightButtonColor,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
