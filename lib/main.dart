import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widgets/app.dart';
import 'package:flutter_widgets/common/SimpleBlocDelegate.dart';
import 'package:flutter_widgets/counter_block.dart';
import 'package:flutter_widgets/counter_state.dart';

void main() {
  Bloc.observer = SimpleBlocDelegate();
  runApp(App());
}
