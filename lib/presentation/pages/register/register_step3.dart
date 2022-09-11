part of "register_page.dart";

class RegisterStep3 extends StatefulWidget {
  const RegisterStep3({super.key, required this.onNext});

  final VoidCallback onNext;

  @override
  State<RegisterStep3> createState() => _RegisterStep3State();
}

class _RegisterStep3State extends State<RegisterStep3> {
  late String _selectedPreferred = Strings.of(context)!.preferredServiceHint;
  late final List<String> _listPreferred = [
    Strings.of(context)!.preferredServiceHint,
    Strings.of(context)!.preferredServiceOptions1,
    Strings.of(context)!.preferredServiceOptions2,
    Strings.of(context)!.preferredServiceOptions3,
    Strings.of(context)!.preferredServiceOptions4,
  ];

  late final List<DataHelper> _listLanguage = [
    DataHelper(id: 1, title: Strings.of(context)!.spanish),
    DataHelper(id: 2, title: Strings.of(context)!.mandarin),
    DataHelper(id: 3, title: Strings.of(context)!.english),
  ];

  final TextEditingController _conLanguage = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextF(
          hint: Strings.of(context)!.occupationTitle,
          hintText: Strings.of(context)!.occupationHint,
        ),
        TextF(
          hint: Strings.of(context)!.companyTitle,
          hintText: Strings.of(context)!.companyHint,
        ),
        TextF(
          curFocusNode: DisableFocusNode(),
          controller: _conLanguage,
          onTap: () async {
            await context.chipPicker(
              _listLanguage,
              Strings.of(context)!.fluentSpokenHint,
            );

            _conLanguage.text = _listLanguage
                .where((element) => element.isSelected)
                .map((e) => e.title)
                .join(", ");
          },
          hint: Strings.of(context)!.fluentSpokenTitle,
          hintText: Strings.of(context)!.fluentSpokenHint,
          suffixIcon: const Icon(Icons.add_circle_outline),
        ),
        DropDown(
          hint: Strings.of(context)!.preferredServiceTitle,
          value: _selectedPreferred,
          items: _listPreferred
              .map(
                (e) => DropdownMenuItem(
                  value: e,
                  child: Text(
                    e,
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                          color: e == Strings.of(context)!.preferredServiceHint
                              ? Palette.black60
                              : null,
                        ),
                  ),
                ),
              )
              .toList(),
          onChanged: (value) {
            if (value != null && value is String) {
              _selectedPreferred = value;
            }
          },
        ),
        TextF(
          hint: Strings.of(context)!.aboutYouTitle,
          hintText: Strings.of(context)!.aboutYouHint,
          maxLength: 100,
          minLine: 5,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: Dimens.space30),
          child: Button(
            width: double.maxFinite,
            title: Strings.of(context)!.submit,
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
