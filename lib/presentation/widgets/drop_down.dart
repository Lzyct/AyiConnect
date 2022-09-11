import 'package:ayiconnect_test/presentation/presentation.dart';
import 'package:flutter/material.dart';

///*********************************************
/// Created by ukietux on 01/11/20 with ♥
/// (>’_’)> email : ukie.tux@gmail.com
/// github : https://www.github.com/Lzyct <(’_’<)
///*********************************************
/// © 2020 | All Right Reserved
class DropDown<T> extends StatefulWidget {
  const DropDown({
    super.key,
    required this.value,
    required this.items,
    this.hint,
    required this.onChanged,
    this.isHintVisible = true,
    this.prefixIcon,
    this.borderRadius,
    this.padding,
  });

  final T value;
  final List<DropdownMenuItem<T>> items;
  final bool isHintVisible;
  final String? hint;
  final ValueChanged<T?>? onChanged;
  final Widget? prefixIcon;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? padding;

  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: widget.isHintVisible ? Dimens.space8 : 0,
        bottom: Dimens.space8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.isHintVisible) ...{
            Text(
              widget.hint ?? "",
              style: Theme.of(context).textTheme.bodyText2?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SpacerV(),
          },
          ButtonTheme(
            key: widget.key,
            alignedDropdown: true,
            padding: EdgeInsets.zero,
            child: DropdownButtonFormField(
              isExpanded: true,
              icon: const Icon(Icons.arrow_drop_down),
              decoration: InputDecoration(
                alignLabelWithHint: true,
                isDense: true,
                isCollapsed: true,
                prefixIcon: widget.prefixIcon == null
                    ? null
                    : Padding(
                        padding: EdgeInsets.only(left: Dimens.space12),
                        child: widget.prefixIcon,
                      ),
                prefixIconConstraints: BoxConstraints(
                  minHeight: Dimens.space24,
                  maxHeight: Dimens.space24,
                ),
                contentPadding: widget.padding ??
                    EdgeInsets.symmetric(vertical: Dimens.space12),
                enabledBorder: OutlineInputBorder(
                  gapPadding: 0,
                  borderRadius: widget.borderRadius ??
                      BorderRadius.circular(Dimens.space8),
                  borderSide: const BorderSide(color: Palette.disable),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  gapPadding: 0,
                  borderRadius: widget.borderRadius ??
                      BorderRadius.circular(Dimens.space8),
                  borderSide: const BorderSide(color: Palette.red),
                ),
                errorBorder: OutlineInputBorder(
                  gapPadding: 0,
                  borderRadius: widget.borderRadius ??
                      BorderRadius.circular(Dimens.space8),
                  borderSide: const BorderSide(color: Palette.red),
                ),
                focusedBorder: OutlineInputBorder(
                  gapPadding: 0,
                  borderRadius: widget.borderRadius ??
                      BorderRadius.circular(Dimens.space8),
                  borderSide: const BorderSide(color: Palette.primary),
                ),
              ),
              value: widget.value,
              items: widget.items,
              onChanged: widget.onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
