part of 'register_page.dart';

class RegisterStep1 extends StatefulWidget {
  const RegisterStep1({super.key, required this.onNext});

  final VoidCallback onNext;

  @override
  State<RegisterStep1> createState() => _RegisterStep1State();
}

class _RegisterStep1State extends State<RegisterStep1> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SpacerV(value: Dimens.space30),
        SvgPicture.asset(
          Images.icFindHelper,
          width: Dimens.space120,
        ),
        SpacerV(value: Dimens.space24),
        Text(
          Strings.of(context)!.findHelperDesc,
          style: Theme.of(context).textTheme.bodyText1,
          textAlign: TextAlign.center,
        ),
        SpacerV(value: Dimens.space12),
        Button(
          width: Dimens.widthButton,
          title: Strings.of(context)!.findHelperTitle,
          onPressed: () => widget.onNext.call(),
        ),
        SpacerV(value: Dimens.space60),
        SvgPicture.asset(Images.icFindJob),
        SpacerV(value: Dimens.space24),
        Text(
          Strings.of(context)!.findJobDesc,
          style: Theme.of(context).textTheme.bodyText1,
          textAlign: TextAlign.center,
        ),
        SpacerV(value: Dimens.space12),
        Button(
          width: Dimens.widthButton,
          title: Strings.of(context)!.findJobTitle,
          onPressed: () => widget.onNext.call(),
          color: Palette.secondary,
        ),
      ],
    );
  }
}
