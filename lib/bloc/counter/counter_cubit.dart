import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial());

  void increment() => emit(state.copyWith(countData: state.countData + 1));
  void decrement() => emit(state.copyWith(countData: state.countData - 1));
}
