part of 'counter_cubit.dart';

class CounterState extends Equatable {
  final double countData;

  CounterState({this.countData = 0});

  CounterState copyWith({
    double? countData
  }) {
    return CounterState(countData: countData ?? this.countData);
  }

  @override
  List<Object?> get props => [countData];
}

class CounterInitial extends CounterState {
  @override
  List<Object> get props => [];
}
