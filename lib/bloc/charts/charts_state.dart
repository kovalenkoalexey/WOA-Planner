part of 'charts_bloc.dart';

@immutable
abstract class ChartsState {}
@immutable
class ChartsLoading extends ChartsState {}
class ChartsData extends ChartsState{
  final List<Chart> charts;

  ChartsData(this.charts);
}
