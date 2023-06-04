part of 'testing_bloc.dart';

abstract class TestingEvent extends Equatable {
  const TestingEvent();
}

class IncrementEvent extends TestingEvent {
  @override
  List<Object?> get props => [];
}

class DecrementEvent extends TestingEvent {
  @override
  List<Object?> get props => [];
}

// increment
// decrement