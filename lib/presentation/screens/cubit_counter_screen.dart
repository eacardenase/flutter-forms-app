import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:forms_app/presentation/blocs/counter_cubit/counter_cubit.dart';

class CubitCounterScreen extends StatelessWidget {
  const CubitCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: const _CubitCounterView(),
    );
  }
}

class _CubitCounterView extends StatelessWidget {
  const _CubitCounterView();

  void increaseCounterBy(BuildContext context, [int value = 1]) {
    context.read<CounterCubit>().increaseBy(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: context.select((CounterCubit value) =>
            Text('Cubit Counter: ${value.state.transactionCount}')),
        actions: [
          IconButton(
            onPressed: () => context.read<CounterCubit>().reset(),
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
      body: Center(
        child: BlocBuilder<CounterCubit, CounterState>(
          builder: (context, state) => Text('Counter value: ${state.counter}'),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => increaseCounterBy(context, 3),
            heroTag: '3',
            child: const Text('+3'),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () => increaseCounterBy(context, 2),
            heroTag: '2',
            child: const Text('+2'),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () => increaseCounterBy(context),
            heroTag: '1',
            child: const Text('+1'),
          ),
        ],
      ),
    );
  }
}
