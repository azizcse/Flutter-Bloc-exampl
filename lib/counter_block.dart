import 'package:bloc/bloc.dart';
import 'package:flutter_widgets/counter_event.dart';
import 'package:flutter_widgets/counter_state.dart';

class CounterBlock extends Bloc<CounterEvent, CounterState> {
  CounterBlock(CounterState initialState) : super(initialState);

  @override
  void onTransition(Transition<CounterEvent, CounterState> transition) {
    //print(transition);
    super.onTransition(transition);
  }

  void onIncrement() {
    //print("Add method called");
    add(IncrementEvent());
  }

  void onDecrement() {
    add(DecrementEvent());
  }

  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    if (event is IncrementEvent) {
      yield* _mapIncrementEventToState(event);
    } else if (event is DecrementEvent) {
      yield* _mapDecrementEventToState(event);
    }
  }

  Stream<CounterState> _mapIncrementEventToState(CounterEvent event) async* {
    state..counter += 1;
    yield CounterIncrement(state.counter);
  }

  Stream<CounterState> _mapDecrementEventToState(CounterEvent) async* {
    state..counter -= 1;
    yield CounterDecrement(state.counter);
  }
}
