import 'package:meta/meta.dart';

@immutable
abstract class SettingsState {}

class InitialSettingsState extends SettingsState {
}

class UnConfigState extends SettingsState{}

class ConfigChangeState extends SettingsState{
  ConfigChangeState({@required this.key, @required this.value});
  final String key;
  final bool value;
}
