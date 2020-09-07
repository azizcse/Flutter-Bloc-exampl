import 'package:flutter/cupertino.dart';

@immutable
abstract class SettingEvent{
}

class SettingValueChange extends SettingEvent{
  SettingValueChange({@required this.key, @required this.value});
  final String key;
  final bool value;
}