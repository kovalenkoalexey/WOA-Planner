import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/chart.dart';
import '../../repository/chart_repository.dart';

part 'charts_event.dart';
part 'charts_state.dart';

class ChartsBloc extends Bloc<ChartsEvent, ChartsState> {
  final ChartRepository chartRepository;
  ChartsBloc(this.chartRepository) : super(ChartsLoading()) {
    on<ChartsEvent>((event, emit) async{ final charts = await chartRepository.getCharts();
      emit(ChartsLoading());
      if (event is RequestChartsEvent) {
        if (event.query?.isNotEmpty == true)
        {final filtered = charts.where((Chart chart)
        => chart.chartCode.toLowerCase().contains(event.query!.toLowerCase())
        ).toList();
           emit(ChartsData(filtered));
        }
        else {
          emit(ChartsData(charts));
        }
      }
    });
  }
}
