import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

enum ThemeType { dark, initial }
enum LanguageType { bangla, english }

abstract class AppConfigEvent extends Equatable {
  const AppConfigEvent();

  @override
  List<Object> get props {
    return <dynamic>[];
  }
}

class AppStarted extends AppConfigEvent {}

class ThemChanged extends AppConfigEvent {
  final ThemeType themeType;

  const ThemChanged({@required this.themeType});

  @override
  List<Object> get props {
    return <ThemeType>[themeType];
  }
}

class LanguageChanged extends AppConfigEvent {
  final LanguageType languageType;

  const LanguageChanged({@required this.languageType});

  @override
  List<Object> get props {
    return <LanguageType>[languageType];
  }
}
