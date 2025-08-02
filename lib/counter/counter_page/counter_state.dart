import 'package:equatable/equatable.dart';

class CounterState extends Equatable {
   @override
  List<Object> get props => [];
}

class CounterInitialState extends CounterState {
  int? count;
  CounterInitialState({required this.count});
   @override
  List<Object> get props => [count ?? 0];
}

class CounterIncrementState extends CounterState {
  int? incCount;
  CounterIncrementState({required this.incCount});
   @override
  List<Object> get props => [incCount ?? 0];
}

class CounterDecrementState extends CounterState {
  int? decCount;
  CounterDecrementState({required this.decCount});
   @override
  List<Object> get props => [decCount ?? 0];
}