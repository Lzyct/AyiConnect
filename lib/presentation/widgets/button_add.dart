import 'package:ayiconnect_test/presentation/presentation.dart';
import 'package:flutter/material.dart';

class ButtonIcon extends StatelessWidget {
  const ButtonIcon({
    super.key,
    required this.title,
    required this.icon,
    required this.onPressed,
    this.width,
  });

  final String title;
  final Icon icon;
  final VoidCallback onPressed;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(
            horizontal: Dimens.space16,
            vertical: Dimens.space8,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(Dimens.cornerRadius),
            ),
            side: BorderSide(width: Dimens.space1, color: Palette.border),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: Theme.of(context).textTheme.bodyText2,
                textAlign: TextAlign.left,
              ),
            ),
            icon,
          ],
        ),
      ),
    );
  }
}
