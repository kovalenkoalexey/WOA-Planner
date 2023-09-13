import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_project_1/repository/chart_repository.dart';
import 'package:home_project_1/theme/app_colors.dart';
import 'package:home_project_1/widgets/auth/auth_widget.dart';
import 'package:home_project_1/widgets/main_screen/main_screen_widget.dart';

import 'bloc/charts/charts_bloc.dart';
// import 'package:home_project_1/widgets/chart_details/chart_details_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<ChartRepository>(
      create: (context) => MockChartRepository(),
      child: BlocProvider(
        create: (context) =>
        ChartsBloc(RepositoryProvider.of<ChartRepository>(context))
          ..add(RequestChartsEvent(null)),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
              appBarTheme: AppBarTheme(
                backgroundColor: AppColors.mainDarkBlue,
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor: AppColors.mainDarkBlue,
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.grey,
              )),
          routes: {
            '/auth': (context) => AuthWidget(),
            '/main_screen': (context) => MainScreenWidget(),
            /* '/main_screen/movie_details':
            (context)
        {
          final arguments = ModalRoute.of(context)?.settings.arguments;//знак вопроса означает, что возможно там ничего нет
          if (arguments is int) {
            return ChartDetailsWidget(chartId: arguments);
          }
          else {
            return ChartDetailsWidget(chartId: 0);
          }
        },*/
          },
          initialRoute: '/auth',
        ),
      ),
    );
  }
}
