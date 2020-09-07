library constants;

import 'package:flutter/material.dart';

const Color primaryColor = Color(0xFF6da12c);
const Color primaryColorDark = Color(0xFF4a6c1e);
const Color secondaryColor = Colors.lightGreen;

enum PlatformType { iOS, Android, Windows, Web, Fuchsia, Linux, MacOS, Others }

class Preference {}

class Locale {
  static const String locale = 'locale';
  static const String en = 'en';
  static const String bn = 'bn';
}

class NavigationHomeOptionIndex{
  static const int remainder = 0;
  static const int memorize = 1;
  static const int ruqiyah = 2;
  static const int dua = 3;
  static const int books = 4;
  static const int donate = 5;
  static const int duas = 6;
  static const int memorize2 = 7;
  static const int ruquyah2 = 8;
}

class NavigationHomeOptionsAsset{
  static const String assetRoot = 'assets/logo/';
  static const String remainder = '${assetRoot}remainder.svg';
  static const String memorize = '${assetRoot}memorize.svg';
  static const String ruqiyah = '${assetRoot}remainder.svg';
  static const String dua = '${assetRoot}dua_qa.svg';
  static const String books = '${assetRoot}books.svg';
  static const String donate = '${assetRoot}donate.svg';
  static const String duas = '${assetRoot}duas.svg';
  static const String memorize2 = '${assetRoot}memorize.svg';
  static const String ruquyah2 = '${assetRoot}donate.svg';
}

class App {
  static const String appName = 'Doa app';
}