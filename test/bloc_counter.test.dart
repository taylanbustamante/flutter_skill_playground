import 'package:flutter_test/flutter_test.dart';
import 'package:skill_playground/blocs/bloc_counter/bloc_counter.bloc.dart';
import 'package:skill_playground/blocs/bloc_counter/events/increment_counter.event.dart';
import 'package:skill_playground/blocs/bloc_counter/events/toggle_allow.event.dart';
import 'package:skill_playground/blocs/bloc_counter/states/counter.state.dart';

void main() {
  test('Incrementa só quando permitido', () {
    final CounterBloc bloc = CounterBloc();
    expect(bloc.state.value, 0);
    bloc.add(IncrementCounterEvent());
    expect(bloc.state.value, 0);
    bloc.add(ToggleAllowEvent());
    expectLater(bloc.stream, emits(isA<CounterState>()));
  });
}
