import 'package:fbloc_cubits_forms/presentation/blocs/counter_cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  @override
  Widget build(BuildContext context) {
    final counterState = context.watch<CounterCubit>().state;
    return Scaffold(
      appBar: AppBar(
        title: Text('Cubit Counter Screen: ${counterState.transactionCount}'),
        actions: [
          IconButton(
              onPressed: () {
                context.read<CounterCubit>().reset();
              },
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: BlocBuilder<CounterCubit, CounterState>(
        // buildWhen: (previous, current) => previous.counter != current.counter,
        builder: (context, state) {
          return Text('Counter: ${state.counter}');
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                heroTag: 'a',
                onPressed: () {
                  context.read<CounterCubit>().multiplicationBy(2);
                },
                child: const Text('X2'),
              ),
              const SizedBox(height: 8),
              FloatingActionButton(
                heroTag: 'b',
                onPressed: () {
                  context.read<CounterCubit>().multiplicationBy(3);
                },
                child: const Text('X3'),
              ),
            ],
          ),
          // const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              FloatingActionButton(
                heroTag: '1',
                onPressed: () {
                  context.read<CounterCubit>().increase();
                },
                child: const Icon(Icons.add),
              ),
              const SizedBox(height: 8),
              FloatingActionButton(
                heroTag: '2',
                onPressed: () {
                  context.read<CounterCubit>().decrease();
                },
                child: const Icon(Icons.remove),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
