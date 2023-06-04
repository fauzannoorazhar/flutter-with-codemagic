part of 'testing_bloc.dart';

class TestingState extends Equatable {
  final double countData;

  TestingState({this.countData = 0});

  TestingState copyWith({
    double? countData
  }) {
    return TestingState(countData: countData ?? this.countData);
  }

  @override
  List<Object?> get props => [countData];
}

class TestingInitial extends TestingState {
  @override
  List<Object> get props => [];
}
