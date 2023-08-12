import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(counter: 0));

  void increase() {
    emit(state.copyWith(
        counter: state.counter + 1,
        transactionCount: state.transactionCount + 1));
  }

  void decrease() {
    emit(state.copyWith(
        counter: state.counter - 1,
        transactionCount: state.transactionCount + 1));
  }

  void reset() {
    emit(state.copyWith(counter: 0));
  }

  void multiplicationBy(int value) {
    emit(state.copyWith(
        counter: state.counter * value,
        transactionCount: state.transactionCount + 1));
  }
  
}
