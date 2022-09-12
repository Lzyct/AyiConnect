import 'dart:io';

import 'package:ayiconnect_test/core/core.dart';
import 'package:ayiconnect_test/data/datasources/datasources.dart';
import 'package:ayiconnect_test/presentation/presentation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  Future bottomSheet({
    required String title,
    required List<Widget> children,
    Function(BuildContext context)? getContext,
  }) =>
      showModalBottomSheet(
        context: this,
        enableDrag: true,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimens.space30),
            topRight: Radius.circular(Dimens.space30),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: Dimens.space16,
        builder: (context) {
          if (getContext != null) {
            getContext(context);
          }
          return AnimatedPadding(
            padding: EdgeInsets.only(
              left: Dimens.space16,
              right: Dimens.space16,
              top: Dimens.space24,
              bottom: Dimens.space24 +
                  MediaQuery.of(context).viewInsets.bottom +
                  MediaQuery.of(context).viewPadding.bottom,
            ),
            duration: const Duration(milliseconds: 300),
            child: Wrap(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: Dimens.bottomBar,
                    height: Dimens.space8,
                    margin: EdgeInsets.only(bottom: Dimens.space24),
                    decoration: const BoxDecoration(
                      color: Palette.disable,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    title,
                    style: TextStyles.h6.copyWith(fontWeight: FontWeight.w500),
                    textAlign: TextAlign.left,
                  ),
                ),
                SpacerV(value: Dimens.space24),
                for (var child in children) child
              ],
            ),
          );
        },
      );

  Future<void> chipPicker(
    List<DataHelper> listDataPicker,
    String title,
  ) async {
    await bottomSheet(
      title: title,
      children: [
        StatefulBuilder(
          builder: (context, setState) {
            return Wrap(
              spacing: Dimens.space8,
              children: [
                for (var data in listDataPicker)
                  FilterChip(
                    backgroundColor: Palette.hint,
                    label: Padding(
                      padding: EdgeInsets.symmetric(horizontal: Dimens.space2),
                      child: Text(
                        data.title ?? "-",
                        style: TextStyles.body1.copyWith(
                          color: Palette.white,
                        ),
                      ),
                    ),
                    selected: data.isSelected,
                    selectedColor: Palette.primary,
                    checkmarkColor: Palette.white,
                    onSelected: (bool selected) {
                      setState(() {
                        data.isSelected = selected;
                      });
                    },
                  ),
                SpacerV(value: Dimens.space24),
                Button(
                  width: double.infinity,
                  title: Strings.of(this)!.submit,
                  onPressed: () {
                    Navigator.pop(context);
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                )
              ],
            );
          },
        )
      ],
    );
  }

  Future<dynamic> birthdayPicker({
    required String title,
    DateTime? initialDate,
    required Function(DateTime) onPositive,
    required Function() onNegative,
  }) {
    var tmpInitialDate = initialDate ??
        DateTime(
          DateTime.now().year - 10,
          DateTime.now().month,
          DateTime.now().day,
        );

    return bottomSheet(
      title: title,
      children: [
        SizedBox(
          height: Dimens.birthdayCalendar,
          child: CupertinoTheme(
            data: CupertinoThemeData(
              textTheme: CupertinoTextThemeData(
                dateTimePickerTextStyle: Theme.of(this).textTheme.bodyText1,
              ),
            ),
            child: CupertinoDatePicker(
              initialDateTime: tmpInitialDate,
              minimumDate: DateTime(
                DateTime.now().year - 50,
                DateTime.now().month,
                DateTime.now().day,
              ),
              maximumDate: DateTime(
                DateTime.now().year - 10,
                DateTime.now().month,
                DateTime.now().day,
              ),
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (dateTime) {
                tmpInitialDate = dateTime;
              },
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: Dimens.space16),
          child: ButtonPair(
            titlePositive: Strings.of(this)!.select,
            titleNegative: Strings.of(this)!.cancel,
            onPositivePressed: () {
              onPositive(tmpInitialDate);
            },
            onNegativePressed: onNegative,
          ),
        ),
      ],
    );
  }

  double widthInPercent(double percent) {
    final toDouble = percent / 100;

    return MediaQuery.of(this).size.width * toDouble;
  }

  double heightInPercent(double percent) {
    final toDouble = percent / 100;

    return MediaQuery.of(this).size.height * toDouble;
  }

  //Start Loading Dialog
  static late BuildContext ctx;

  Future<void> show() => showDialog(
        context: this,
        barrierDismissible: false,
        builder: (c) {
          ctx = c;

          return WillPopScope(
            onWillPop: () async => false,
            child: Material(
              color: Colors.transparent,
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Palette.white,
                    borderRadius: BorderRadius.circular(Dimens.cornerRadius),
                  ),
                  margin: EdgeInsets.symmetric(horizontal: Dimens.space30),
                  padding: EdgeInsets.all(Dimens.space24),
                  child: Wrap(
                    children: [
                      if (Platform.isAndroid)
                        const CircularProgressIndicator()
                      else
                        const CupertinoActivityIndicator()
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      );

  void dismiss() {
    try {
      Navigator.pop(ctx);
    } catch (_) {}
  }
}
