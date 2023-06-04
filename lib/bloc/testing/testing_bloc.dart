import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'testing_event.dart';
part 'testing_state.dart';

class TestingBloc extends Bloc<TestingEvent, TestingState> {
  TestingBloc() : super(TestingInitial()) {
    on<IncrementEvent>((event, emit) {
      emit(state.copyWith(countData: state.countData + 1));
    });

    on<DecrementEvent>((event, emit) {
      emit(state.copyWith(countData: state.countData - 1));
    });
  }
}
