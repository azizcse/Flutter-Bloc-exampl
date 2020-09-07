import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
class CounterState extends Equatable {
  int counter = 0;

  CounterState(this.counter);

  @override
  List<Object> get props => [counter];
}

class CounterIncrement extends CounterState {
  int increment;

  CounterIncrement(this.increment) : super(increment);

  @override
  List<Object> get props {
    return [increment];
  }

  @override
  String toString() {
    return "CounterIncrement: $counter";
  }
}

class CounterDecrement extends CounterState {
  int decrement;

  CounterDecrement(this.decrement) : super(decrement);

  @override
  List<Object> get props => [decrement];

  @override
  String toString() {
    return "CounterDecremnt: $counter";
  }
}
