import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_project_1/bloc/charts/charts_bloc.dart';

import '../../details/chart_details.dart';
import '../../models/chart.dart';

class ChartListWidget extends StatefulWidget {
  @override
  _ChartListWidgetState createState() => _ChartListWidgetState();
}

class _ChartListWidgetState extends State<ChartListWidget> {
  final _searchController = TextEditingController();

  void _searchCharts() {
    final bloc = BlocProvider.of<ChartsBloc>(context);
    final query = _searchController.text;
    bloc.add(RequestChartsEvent(query));
  }

  @override
  void initState() {
    super.initState();

    _searchController.addListener(_searchCharts);
  }

  void _onChartTap(Chart chart) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ChartInfo(chart: chart)));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      BlocBuilder<ChartsBloc, ChartsState>(
        builder: (context, state) {
          if (state is ChartsData) {
            return ListView.builder(
                padding: EdgeInsets.only(top: 70),
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                itemCount: state.charts.length,
                itemExtent: 163,
                itemBuilder: (BuildContext context, int index) {
                  final chart = state.charts[index];
                  return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 10),
                      child: Stack(children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 10),
                          decoration: BoxDecoration(
                              //color: Colors.white,
                              border: Border.all(
                                  color: Colors.black.withOpacity(0.2)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 8,
                                  offset: Offset(0, 2),
                                ),
                              ]),
                          clipBehavior: Clip.hardEdge,
                          child: Row(
                            children: [
                              // Image(image: AssetImage(movie.imageName)),
                              SizedBox(width: 15),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(width: 20),
                                    Text(
                                      chart.date,
                                      style: TextStyle(color: Colors.grey),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(width: 5, height: 25),
                                    Text(
                                      chart.chartCode,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(
                                      width: 20,
                                      height: 15,
                                    ),
                                    Text(chart.description,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis)
                                  ],
                                ),
                              ),
                              SizedBox(width: 10)
                            ],
                          ),
                        ),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            onTap: () => _onChartTap(chart),
                          ),
                        )
                      ]));
                });
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
                labelText: 'Поиск',
                filled: true,
                fillColor: Colors.white.withAlpha(235),
                border: OutlineInputBorder()),
          )),
    ]);
  }
}
