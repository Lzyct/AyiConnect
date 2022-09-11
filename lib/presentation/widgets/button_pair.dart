import 'package:ayiconnect_test/presentation/presentation.dart';
import 'package:flutter/material.dart';

///*********************************************
///  my-ananda-hospital |
///  button_pair.dart
/// --------------------------------------------
/// Created by Mudassir 🧑🏻‍💻 @ >codelogs_
/// on 📅 06/06/21 🕰 13:51 with ❤️
/// email : hey.mudassir@gmail.com
/// github : https://www.github.com/Lzyct
///*********************************************
/// © 2021 | All Right Reserved
class ButtonPair extends StatelessWidget {
  final String titlePositive;
  final String titleNegative;
  final VoidCallback onPositivePressed;
  final VoidCallback onNegativePressed;

  const ButtonPair({
    super.key,
    required this.titlePositive,
    required this.titleNegative,
    required this.onPositivePressed,
    required this.onNegativePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Button(
            title: titleNegative,
            onPressed: onNegativePressed,
          ),
        ),
        const SpacerH(),
        Expanded(
          child: Button(
            title: titlePositive,
            onPressed: onPositivePressed,
          ),
        ),
      ],
    );
  }
}
