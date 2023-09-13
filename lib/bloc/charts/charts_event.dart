part of 'charts_bloc.dart';

@immutable
abstract class ChartsEvent {}

class RequestChartsEvent extends ChartsEvent {
  final String? query;

  RequestChartsEvent(this.query);
}
