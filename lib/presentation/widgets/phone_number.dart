import 'package:ayiconnect_test/core/core.dart';
import 'package:ayiconnect_test/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PhoneNumber extends StatelessWidget {
  const PhoneNumber({
    super.key,
    required this.selectedPhoneCode,
    required this.listPhoneCode,
    required this.onPhoneCodeChange,
    required this.onPhoneNumberChange,
  });

  final String selectedPhoneCode;
  final List<String> listPhoneCode;
  final Function(String) onPhoneCodeChange;
  final Function(String) onPhoneNumberChange;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SpacerV(),
        Text(
          Strings.of(context)!.phoneNumberTitle,
          style: Theme.of(context).textTheme.bodyText2?.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
        Container(
          height: Dimens.space42,
          margin: EdgeInsets.symmetric(vertical: Dimens.space8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(Dimens.space8)),
            border: Border.all(color: Palette.border, width: Dimens.space1),
          ),
          child: IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 3,
                  child: ButtonTheme(
                    alignedDropdown: true,
                    padding: EdgeInsets.zero,
                    child: DropdownButtonFormField(
                      isExpanded: true,
                      icon: const Icon(Icons.arrow_drop_down),
                      decoration: const InputDecoration(
                        alignLabelWithHint: true,
                        isDense: true,
                        isCollapsed: true,
                        border: InputBorder.none,
                      ),
                      value: selectedPhoneCode,
                      items: listPhoneCode
                          .map(
                            (e) => DropdownMenuItem(value: e, child: Text(e)),
                          )
                          .toList(),
                      onChanged: (value) {
                        if (value != null && value is String) {
                          onPhoneCodeChange(value);
                        }
                      },
                    ),
                  ),
                ),
                VerticalDivider(
                  color: Palette.border,
                  thickness: Dimens.space1,
                  indent: 0,
                  endIndent: 0,
                ),
                Expanded(
                  flex: 9,
                  child: TextFormField(
                    textAlignVertical: TextAlignVertical.center,
                    style: Theme.of(context).textTheme.bodyText2,
                    cursorColor: Palette.text,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                      alignLabelWithHint: true,
                      isDense: true,
                      hintText: Strings.of(context)!.phoneNumberHint,
                      hintStyle: Theme.of(context)
                          .textTheme
                          .bodyText2
                          ?.copyWith(color: Palette.black60),
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: Dimens.space4),
                    ),
                    validator: (value) {},
                    onChanged: onPhoneNumberChange,
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
