import 'package:ayiconnect_test/data/datasources/local/pref_manager.dart';
import 'package:flutter/material.dart';

class DataHelper {
  final String? title;
  final String? desc;
  bool isSelected;
  final String? iconPath;
  final IconData? icon;
  final String? url;
  final String? type;
  final int? id;
  final ActiveTheme activeTheme;

  DataHelper({
    this.title,
    this.desc,
    this.isSelected = false,
    this.iconPath,
    this.icon,
    this.url,
    this.type,
    this.id,
    this.activeTheme = ActiveTheme.light,
  });
}
