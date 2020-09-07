import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widgets/common/bloc/appconfig_bloc.dart';
import 'package:flutter_widgets/common/bloc/appconfig_state.dart';
import 'package:flutter_widgets/common/route_generator.dart';
import 'package:flutter_widgets/common/routes.dart';
import 'package:flutter_widgets/counter_block.dart';
import 'package:flutter_widgets/counter_state.dart';
import 'generated/l10n.dart';
import 'common/constants.dart'as constants;

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AppState();
  }
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppConfigBloc>(
          create: (context) => AppConfigBloc(),
        ),
        BlocProvider<CounterBlock>(
          create: (context)=>CounterBlock(CounterState(0)),
        ),
      ],
      child: BlocBuilder<AppConfigBloc, AppConfigState>(
        builder: (context, configState) {
          return MaterialApp(
            localizationsDelegates: [],
            locale: configState.locale,
            supportedLocales: S.delegate.supportedLocales,
            title: constants.App.appName,
            theme: configState.theme,
            onGenerateRoute: RouteGenerator.generateRoute,
            initialRoute: Routes.landing,
          );
        },
      ),
    );
  }
}
