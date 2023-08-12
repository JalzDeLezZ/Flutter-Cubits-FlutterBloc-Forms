import 'package:fbloc_cubits_forms/presentation/blocs/counter_bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterBloc(),
      child: const BlocCounterView(),
    );
  }
}

class BlocCounterView extends StatelessWidget {
  const BlocCounterView({
    super.key,
  });

  void increaseCounterBy(BuildContext context, [int value = 1]) {
    //! First way to do it
    // context.read<CounterBloc>().add(CounterIncreased(value));
    //? Second way to do it
    context.read<CounterBloc>().increaseCounterByX(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: context.select((CounterBloc fbloc) =>
            Text('Counter: ${fbloc.state.transactionCount}')),
        actions: [
          IconButton(
              //! First way to do it
              // onPressed: () => context.read<CounterBloc>().add(const CounterReset()),
              //? Second way to do it
              onPressed: () => context.read<CounterBloc>().resetCounter(),
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: Center(
        child: context.select((CounterBloc counterBloc) => Text(
              '${counterBloc.state.counter}',
              style: const TextStyle(fontSize: 24),
            )),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: '1',
            onPressed: () => increaseCounterBy(context),
            child: const Text('+1'),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            heroTag: '2',
            onPressed: () => increaseCounterBy(context, 2),
            child: const Text('+2'),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            heroTag: '3',
            onPressed: () => increaseCounterBy(context, 3),
            child: const Text('+3'),
          ),
        ],
      ),
    );
  }
}
