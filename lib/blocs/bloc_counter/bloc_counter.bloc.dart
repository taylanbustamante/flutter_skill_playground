import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_playground/blocs/bloc_counter/events/counter.event.dart';
import 'package:skill_playground/blocs/bloc_counter/events/increment_counter.event.dart';
import 'package:skill_playground/blocs/bloc_counter/events/toggle_allow.event.dart';
import 'package:skill_playground/blocs/bloc_counter/states/counter.state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState(0, false)) {
    on<ToggleAllowEvent>(_toggleAllow);
    on<IncrementCounterEvent>(_incrementCounte);
  }

  _toggleAllow(ToggleAllowEvent event, Emitter<CounterState> emit) {
    emit(CounterState(state.value, !state.allow));
  }

  _incrementCounte(IncrementCounterEvent event, Emitter<CounterState> emit) {
    if (state.allow) emit(CounterState(state.value + 1, state.allow));
  }
}
