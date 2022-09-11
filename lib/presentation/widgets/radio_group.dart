import 'package:ayiconnect_test/data/data.dart';
import 'package:ayiconnect_test/presentation/presentation.dart';
import 'package:flutter/material.dart';

///*********************************************
/// Created by ukietux on 08/11/20 with ♥
/// (>’_’)> email : ukie.tux@gmail.com
/// github : https://www.github.com/Lzyct <(’_’<)
///*********************************************
/// © 2020 | All Right Reserved

enum RGOrientation { vertical, horizontal }

class RadioGroup extends StatefulWidget {
  final RGOrientation orientation;

  final List<DataHelper> titles;
  final String? label;
  final Function(int)? onChanged;

  const RadioGroup({
    super.key,
    this.orientation = RGOrientation.horizontal,
    required this.titles,
    this.label,
    this.onChanged,
  });

  @override
  _RadioGroupState createState() => _RadioGroupState();
}

class _RadioGroupState extends State<RadioGroup> {
  int _defaultValue = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label ?? "",
          style: Theme.of(context).textTheme.bodyText2?.copyWith(
                fontWeight: FontWeight.w500,
              ),
        ),
        SpacerV(value: Dimens.space8),
        if (widget.orientation == RGOrientation.vertical)
          _vertical()
        else
          _horizontal(),
        SpacerV(value: Dimens.space8),
      ],
    );
  }

  Row _horizontal() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: Iterable<int>.generate(widget.titles.length).map((index) {
        return InkWell(
          onTap: () {
            setState(() {
              _defaultValue = index;
              widget.onChanged!(_defaultValue);
            });
          },
          child: Container(
            decoration: BoxDecoration(
              border: _defaultValue == index
                  ? null
                  : Border.all(color: Palette.border),
              borderRadius: BorderRadius.all(Radius.circular(Dimens.space8)),
              color: _defaultValue == index ? Palette.secondary : null,
            ),
            width: Dimens.widthStepper,
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: Dimens.space24,
                  child: Radio(
                    value: index,
                    groupValue: _defaultValue,
                    activeColor: Palette.systemGrayLight,
                    onChanged: (dynamic value) {
                      setState(() {
                        _defaultValue = value as int;
                        widget.onChanged!(_defaultValue);
                      });
                    },
                  ),
                ),
                SizedBox(width: Dimens.space2),
                Text(
                  widget.titles[index].title ?? "",
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        color: _defaultValue == index
                            ? Palette.systemGrayLight
                            : null,
                      ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  Column _vertical() {
    return Column(
      children: Iterable<int>.generate(widget.titles.length)
          .map(
            (index) => Row(
              children: [
                Radio(
                  value: index,
                  groupValue: _defaultValue,
                  activeColor: Palette.primary,
                  onChanged: (dynamic value) {
                    setState(() {
                      _defaultValue = value as int;
                      widget.onChanged!(_defaultValue);
                    });
                  },
                ),
                SizedBox(width: Dimens.space4),
                InkWell(
                  onTap: () {
                    setState(() {
                      _defaultValue = index;
                      widget.onChanged!(_defaultValue);
                    });
                  },
                  child: Text(
                    widget.titles[index].title ?? "",
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
              ],
            ),
          )
          .toList(),
    );
  }
}
