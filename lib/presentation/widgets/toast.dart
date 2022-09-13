import 'package:ayiconnect_test/presentation/presentation.dart';
import 'package:flutter/material.dart';

///*********************************************
/// Created by ukietux on 11/09/20 with ♥
/// (>’_’)> email : ukie.tux@gmail.com
/// github : https://www.github.com/Lzyct <(’_’<)
///*********************************************
/// © 2020 | All Right Reserved
class Toast extends StatelessWidget {
  final IconData? icon;
  final Color? bgColor;
  final Color? textColor;
  final String? message;

  const Toast({
    super.key,
    this.icon,
    this.bgColor,
    this.message,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(Dimens.space16),
          ),
          padding: EdgeInsets.symmetric(
            vertical: Dimens.space8,
            horizontal: Dimens.space16,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: textColor,
              ),
              SizedBox(width: Dimens.space4),
              Container(
                constraints: BoxConstraints(maxWidth: Dimens.maxWidthToast),
                child: Text(
                  message!,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      ?.copyWith(color: textColor),
                  textAlign: TextAlign.start,
                  maxLines: 5,
                  softWrap: true,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
