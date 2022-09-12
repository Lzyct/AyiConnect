part of "register_page.dart";

class RegisterStep2 extends StatefulWidget {
  const RegisterStep2({super.key, required this.onNext});

  final VoidCallback onNext;

  @override
  State<RegisterStep2> createState() => _RegisterStep2State();
}

class _RegisterStep2State extends State<RegisterStep2> {
  final TextEditingController _conBirthday = TextEditingController();
  final TextEditingController _conLocation = TextEditingController(text: "-");

  late final List<DataHelper> _listGender = [
    DataHelper(id: 1, title: Strings.of(context)!.male),
    DataHelper(id: 2, title: Strings.of(context)!.female),
    DataHelper(id: 3, title: Strings.of(context)!.others),
  ];

  String _selectedPhoneCode = "+62";
  late final _listPhoneCode = [
    "+62",
    "+1",
    "+45",
  ];

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listener: (_, state) {
        log.d("State $state");
        switch (state.status) {
          case RegisterStatus.loading:
            context.show();
            break;
          case RegisterStatus.success:
            _conLocation.text = state.location?.description ?? "-";
            context.dismiss();
            break;
          case RegisterStatus.failure:
            context.dismiss();
            state.message.toString().toToastError();
            break;
        }
      },
      child: Column(
        children: [
          _buildHeader(),
          const SpacerV(),
          Divider(color: Palette.divider, thickness: Dimens.space1),
          const SpacerV(),
          Divider(color: Palette.divider, thickness: Dimens.space1),
          ..._buildForm(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: Dimens.space16),
            child: Button(
              width: double.maxFinite,
              title: Strings.of(context)!.next,
              onPressed: () => widget.onNext.call(),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        CircleAvatar(
          radius: Dimens.profilePicture + Dimens.space1,
          backgroundColor: Palette.systemGrayDark,
          child: CircleAvatar(
            radius: Dimens.space40,
            child: SvgPicture.asset(
              Images.icProfilePlaceHolder,
              width: double.maxFinite,
            ),
          ),
        ),
        SpacerH(value: Dimens.space16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ButtonIcon(
                title: Strings.of(context)!.addPhotoProfileTitle,
                icon: const Icon(
                  Icons.add_circle_outline,
                  color: Palette.systemGrayDark,
                ),
                onPressed: () {},
              ),
              const SpacerV(),
              Text(
                Strings.of(context)!.addPhotoProfileDesc,
                style: Theme.of(context).textTheme.caption,
              )
            ],
          ),
        )
      ],
    );
  }

  List<Widget> _buildForm() {
    return [
      TextF(
        hint: Strings.of(context)!.fullNameTitle,
        hintText: Strings.of(context)!.fullNameHint,
      ),
      RadioGroup(
        label: Strings.of(context)!.selectGenderTitle,
        titles: _listGender,
        onChanged: (int index) {
          log.d("index selected $index");
        },
      ),
      TextF(
        controller: _conBirthday,
        hint: Strings.of(context)!.chooseBirthdayTitle,
        hintText: Strings.of(context)!.chooseBirthdayHint,
        suffixIcon: const Icon(Icons.calendar_month_outlined),
        curFocusNode: DisableFocusNode(),
        onTap: () async {
          await context.birthdayPicker(
            title: Strings.of(context)!.chooseBirthdayTitle,
            initialDate: DateTime(
              DateTime.now().year - 10,
              DateTime.now().month,
              DateTime.now().day,
            ),
            onPositive: (DateTime value) {
              _conBirthday.text = value.toString().toStringDate();
              Navigator.pop(context);
            },
            onNegative: () {
              Navigator.pop(context);
            },
          );
        },
      ),
      PhoneNumber(
        selectedPhoneCode: _selectedPhoneCode,
        listPhoneCode: _listPhoneCode,
        onPhoneCodeChange: (String value) {
          log.d("Phone code change $value");
          _selectedPhoneCode = value;
        },
        onPhoneNumberChange: (String value) {
          log.d("Phone code number $value");
        },
      ),
      TextF(
        controller: _conLocation,
        hint: Strings.of(context)!.currentLocationTitle,
        hintText: Strings.of(context)!.currentLocationHint,
        suffixIcon: const Icon(Icons.arrow_drop_down_outlined),
      ),
    ];
  }
}
