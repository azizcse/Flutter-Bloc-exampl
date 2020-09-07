import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_widgets/common/bloc/appconfig_bloc.dart';
import 'package:flutter_widgets/common/bloc/appconfig_event.dart';
import 'package:flutter_widgets/pages/setting/constants.dart';
import 'package:flutter_widgets/pages/setting/setting_event.dart';
import 'package:flutter_widgets/pages/setting/settings_state.dart';


class SettingsBloc extends Bloc<SettingEvent, SettingsState> {
  SettingsBloc({@required this.bloc}) : super(UnConfigState());
  AppConfigBloc bloc;

  @override
  Stream<SettingsState> mapEventToState(
    SettingEvent event,
  ) async* {
    if (event is SettingValueChange) {
      if (event.key == Constants.configDarkMode) {
        if(event.value){
          bloc.add(const ThemChanged(themeType: ThemeType.dark));
        }else{
          bloc.add(const ThemChanged(themeType: ThemeType.initial));
        }
      }

      yield ConfigChangeState(key: event.key, value: event.value);
    }
  }
}
