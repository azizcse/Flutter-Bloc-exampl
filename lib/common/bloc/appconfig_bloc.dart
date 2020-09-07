import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/common/bloc/appconfig_event.dart';
import 'package:flutter_widgets/common/bloc/appconfig_state.dart';

class AppConfigBloc extends Bloc<AppConfigEvent, AppConfigState> {
  AppConfigBloc()
      : super(AppConfigState(
            theme: buildDefultTheme(),
            locale: const Locale('bn'),
            themeName: 'initial')) {
    add(AppStarted());
  }

  @override
  Stream<AppConfigState> mapEventToState(AppConfigEvent event) async* {
    if(event is AppStarted){
      yield* _mapAppStartedEventToState();
    }

    if (event is ThemChanged) {
      yield* _mapThemeChanged(event.themeType);
    }
    if (event is LanguageChanged) {
      yield* _mapLanguageChanged(event.languageType);
    }
  }

  Stream<AppConfigState> _mapAppStartedEventToState()async*{
    yield AppConfigState(
        theme: buildDefultTheme(),
        locale: const Locale('bn'), themeName: 'initial');
  }

  Stream<AppConfigState> _mapLanguageChanged(LanguageType languageType) async* {
    AppConfigState appConfigState;
    switch (languageType) {
      case LanguageType.bangla:

        appConfigState = AppConfigState(
            theme: state.theme, locale: const Locale('bn'), themeName: state.themeName);
        break;
      case LanguageType.english:

        appConfigState = AppConfigState(
            theme: state.theme, locale: const Locale('bn'), themeName: state.themeName);
        break;
    }

    yield appConfigState;
  }

  Stream<AppConfigState> _mapThemeChanged(ThemeType changedTheme) async* {
    AppConfigState appConfigState;

    switch (changedTheme) {
      case ThemeType.initial:
        appConfigState =
            AppConfigState(
                theme: buildDefultTheme(),
                locale: state.locale,
                themeName: "initial"
            );
        break;

      case ThemeType.dark:
        appConfigState =
            AppConfigState(
                theme: _buildDarkTheme(),
                locale: state.locale,
                themeName: "dark"
            );
        break;
    }
    yield appConfigState;
  }

  static ThemeData buildDefultTheme() {
    const primaryColor = Color(0xFF6da12c);
    const secondaryColor = Colors.lightGreen;
    const colorPrimaryDark = Color(0xFF4a6c1e);

    final colorScheme = const ColorScheme.light().copyWith(
      primary: primaryColor,
      secondary: secondaryColor,
    );
    final base = ThemeData(
      backgroundColor: const Color(0xFFEEF1F2),
      primaryColor: primaryColor,
      //primaryColorDark: const Color(0xFF0050a0),
      primaryColorLight: secondaryColor,
      indicatorColor: Colors.black,
      toggleableActiveColor: primaryColor,
      accentColor: secondaryColor,
      appBarTheme: const AppBarTheme(
          color: const Color(0xFF23ab61),
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          )),
      primaryColorDark: colorPrimaryDark,
      buttonTheme: ButtonThemeData(
        buttonColor: primaryColor,
        textTheme: ButtonTextTheme.accent,
        colorScheme: colorScheme.copyWith(secondary: Colors.white),
      ),

      cardColor: Colors.white,

      iconTheme: IconThemeData(color: Colors.green),

      unselectedWidgetColor: Colors.black,

      //canvasColor: const Color(0xFF202124),
      //scaffoldBackgroundColor: const Color(0xFF202124),
      //backgroundColor: const Color(0xFF202124),
      errorColor: Colors.red,
    );
    return base.copyWith(
      textTheme: _buildTextTheme(base.textTheme),
      primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
      accentTextTheme: _buildTextTheme(base.accentTextTheme),
    );
  }

  ThemeData _buildDarkTheme() {
    const primaryColor = Color(0xFF122337);
    const secondaryColor = Colors.lightGreen;
    const colorPrimaryDark = Color(0xFF4a6c1e);

    final colorScheme = const ColorScheme.light().copyWith(
      primary: primaryColor,
      secondary: secondaryColor,
    );
    final base = ThemeData(
      backgroundColor: const Color(0xFF122337),
      primaryColor: primaryColor,
      //primaryColorDark: const Color(0xFF0050a0),
      primaryColorLight: secondaryColor,
      indicatorColor: Colors.black,
      toggleableActiveColor: primaryColor,
      accentColor: secondaryColor,
      appBarTheme: const AppBarTheme(
          color: const Color(0xFF223449),
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          )),
      primaryColorDark: colorPrimaryDark,
      buttonTheme: ButtonThemeData(
        buttonColor: primaryColor,
        textTheme: ButtonTextTheme.accent,
        colorScheme: colorScheme.copyWith(secondary: Colors.white),
      ),

      cardColor: const Color(0xFF223449),

      iconTheme: IconThemeData(
          color: Colors.green
      ),

      unselectedWidgetColor: Colors.black,

      //canvasColor: const Color(0xFF202124),
      //scaffoldBackgroundColor: const Color(0xFF202124),
      //backgroundColor: const Color(0xFF202124),
      errorColor: Colors.red,
    );
    return base.copyWith(
      textTheme: _buildTextThemeDark(base.textTheme),
      primaryTextTheme: _buildTextThemeDark(base.primaryTextTheme),
      accentTextTheme: _buildTextTheme(base.accentTextTheme),
    );
  }

  static TextTheme _buildTextTheme(TextTheme base) {
    return base.copyWith(
        headline6: base.headline6.copyWith(
          fontFamily: 'GoogleSans',
        ),
        subtitle1: base.subtitle1.copyWith(
            color: Colors.black
        )
    );
  }

  static TextTheme _buildTextThemeDark(TextTheme base) {
    return base.copyWith(
        headline6: base.headline6.copyWith(
            fontFamily: 'GoogleSans',
            color: Colors.white
        ),
        subtitle1: base.subtitle1.copyWith(
            color: Colors.white
        )
    );
  }
}
