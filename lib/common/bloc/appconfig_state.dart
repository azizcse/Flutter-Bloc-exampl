import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AppConfigState extends Equatable {
  final ThemeData theme;
  final Locale locale;
  final String themeName;

  const AppConfigState({@required this.theme, @required this.locale, @required this.themeName});

  @override
  List<Object> get props {
    return [theme, locale, themeName];
  }
}
