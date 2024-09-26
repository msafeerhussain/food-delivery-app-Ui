// ignore_for_file: public_member_api_docs, sort_constructors_first
// DelayedContainer widget'ı, her bir container'ın gecikmeli olarak görünmesini sağlar
import 'package:flutter/material.dart';

import 'package:foodie/constants/constants.dart';
import 'package:foodie/widgets/title_text.dart';

class DelayedContainer extends StatefulWidget {
  final String productImage;
  final String title;
  final String price;
  final int index;
  const DelayedContainer({
    Key? key,
    required this.productImage,
    required this.title,
    required this.price,
    required this.index,
  }) : super(key: key);

  @override
  _DelayedContainerState createState() => _DelayedContainerState();
}

class _DelayedContainerState extends State<DelayedContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    // Her bir container 300 ms gecikmeli olarak başlayacak
    Future.delayed(Duration(milliseconds: widget.index * 300), () {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: Stack(
        children: [
          Container(
            height: 350,
            width: double.infinity,
          ),
          Container(
            height: 250,
            width: double.infinity,
            margin: const EdgeInsets.only(top: 80),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    primaryTextColor,
                    primaryButtonColor,
                    primaryTextColor,
                    primaryButtonColor,
                  ],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                )),
            child: Column(
              children: [
                const SizedBox(height: 80),
                TitleText(
                  text: widget.title,
                  fontSize: 23,
                  color: darkTextColor,
                ),
                TitleText(
                  text: "${widget.price} \$",
                  fontSize: 25,
                  color: darkTextColor,
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              widget.productImage,
              height: 180,
              width: 180,
            ),
          ),
        ],
      ),
    );
  }
}
