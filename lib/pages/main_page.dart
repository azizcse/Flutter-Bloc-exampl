import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widgets/common/bloc/appconfig_bloc.dart';
import 'package:flutter_widgets/counter_block.dart';
import 'package:flutter_widgets/counter_state.dart';
import 'package:flutter_widgets/pages/setting/constants.dart';
import 'package:flutter_widgets/pages/setting/setting_event.dart';
import 'package:flutter_widgets/pages/setting/settings_bloc.dart';
import 'package:flutter_widgets/pages/setting/settings_state.dart';

class MainApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainAppState();
  }
}

class _MainAppState extends State<MainApp> {
  CounterBlock _counterBloc; // = BlocProvider.of<CounterBlock>(context);
  bool isDarkMode = false;
  AppConfigBloc configBloc;

  @override
  void initState() {
    configBloc = BlocProvider.of<AppConfigBloc>(context);
    _counterBloc = BlocProvider.of<CounterBlock>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        backgroundColor: const Color(0xFF23ab61),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterBlock, CounterState>(
              builder: (context, state) {
                return Text("Count value ${state.counter}");
              },
            ),
            SizedBox(height: 40),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  onPressed: () {
                    // _counterBloc = BlocProvider.of<CounterBlock>(context);
                    _counterBloc.onIncrement();
                  },
                  child: Text("Increment"),
                ),
                SizedBox(
                  width: 20,
                ),
                RaisedButton(
                  onPressed: () {
                    //_counterBloc = BlocProvider.of<CounterBlock>(context);
                    _counterBloc.onDecrement();
                  },
                  child: Text("Decrenent"),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: BlocProvider(
                create: (context) => SettingsBloc(bloc: configBloc),
                child: BlocBuilder<SettingsBloc, SettingsState>(
                    builder: (context, SettingsState state) {
                  if (state is ConfigChangeState) {
                    if (state.key == Constants.configDarkMode) {
                      isDarkMode = state.value;
                    }
                  }
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Change theme"),
                      Switch(
                          value: isDarkMode,
                          activeTrackColor: const Color(0xFF23ab61),
                          onChanged: (value) {
                            BlocProvider.of<SettingsBloc>(context).add(
                                SettingValueChange(
                                    key: Constants.configDarkMode,
                                    value: value));
                          }),
                    ],
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*

class CounterScreen extends StatefulWidget {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    final _counterBloc = BlocProvider.of<CounterBlock>(context);
    return
  }


}*/
