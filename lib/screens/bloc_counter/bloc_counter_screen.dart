import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_playground/blocs/bloc_counter/bloc_counter.bloc.dart';
import 'package:skill_playground/blocs/bloc_counter/events/increment_counter.event.dart';
import 'package:skill_playground/blocs/bloc_counter/events/toggle_allow.event.dart';
import 'package:skill_playground/blocs/bloc_counter/states/counter.state.dart';

class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: Scaffold(
        appBar: AppBar(title: const Text('BLoC Counter')),
        body: Center(
          child: BlocBuilder<CounterBloc, CounterState>(
            buildWhen: (prev, curr) =>
                curr.value % 2 == 0 || prev.allow != curr.allow,
            builder: (context, state) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Permitido incrementar: ${state.allow}'),
                  const SizedBox(height: 8),
                  Text(
                    'Valor (Rebuilda somente em pares): ${state.value % 2 == 0 ? state.value : state.value - 1}',
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 8,
                    children: [
                      ElevatedButton(
                        onPressed: () =>
                            context.read<CounterBloc>().add(ToggleAllowEvent()),
                        child: const Text('Alternar Permissão'),
                      ),
                      FilledButton(
                        onPressed: () => context.read<CounterBloc>().add(
                          IncrementCounterEvent(),
                        ),
                        child: const Text('Incrementar'),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
