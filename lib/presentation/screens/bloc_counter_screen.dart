import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:forms_app/presentation/blocs/counter_bloc/counter_bloc.dart';

class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: const _BlocCounterView(),
    );
  }
}

class _BlocCounterView extends StatelessWidget {
  const _BlocCounterView();

  void _increaseCounterBy(BuildContext context, [int value = 1]) {
    context.read<CounterBloc>().add(CounterIncreased(value));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: context.select((CounterBloc bloc) =>
            Text('BLoC Counter: ${bloc.state.transactionCount}')),
        actions: [
          IconButton(
            onPressed: () =>
                context.read<CounterBloc>().add(const CounterReset()),
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
      body: Center(
        child: context.select(
            (CounterBloc bloc) => Text('Counter value: ${bloc.state.counter}')),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => _increaseCounterBy(context, 3),
            heroTag: '3',
            child: const Text('+3'),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () => _increaseCounterBy(context, 2),
            heroTag: '2',
            child: const Text('+2'),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () => _increaseCounterBy(context),
            heroTag: '1',
            child: const Text('+1'),
          ),
        ],
      ),
    );
  }
}
