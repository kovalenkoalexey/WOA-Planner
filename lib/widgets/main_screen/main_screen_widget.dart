import 'package:flutter/material.dart';
import 'package:home_project_1/widgets/lists/chart_list_widget.dart';
import 'package:home_project_1/widgets/lists/route_list_widget.dart';
// import 'package:themoviedb_3/widgets/movie_list/movie_list_widget.dart';


class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({Key? key}) : super(key: key);

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  int _selectedTab = 0;

  void onSelectTab(int index) {
    if (_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WOA Planner'),
        leading: const Icon(Icons.airplanemode_on),
      ),
      body: IndexedStack(
        index: _selectedTab,
        children: [
          ChartListWidget(),
          FlightRoutesListWidget(),
          Text('Последние новости'),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.map_outlined), label: 'Чарты'),
          BottomNavigationBarItem(
              icon: Icon(Icons.network_locked_outlined), label: 'Маршруты'),
          BottomNavigationBarItem(icon: Icon(Icons.newspaper), label: 'Последние новости')
        ],
        onTap: onSelectTab,
      ),
    );
  }
}
