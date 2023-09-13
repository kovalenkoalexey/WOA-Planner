import 'package:flutter/material.dart';
import '/main.dart';
import 'package:home_project_1/widgets/lists/route_list_widget.dart';

class FlightRouteInfo extends StatefulWidget {
  FlightRoute flightRoute;

  FlightRouteInfo({required this.flightRoute});

  _FlightRouteInfoState createState() => _FlightRouteInfoState(
      flightRoute:
          this.flightRoute); // сюда передаем текущее состояние страницы
}

class _FlightRouteInfoState extends State<FlightRouteInfo> {
  FlightRoute flightRoute;

  _FlightRouteInfoState({required this.flightRoute});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text('Word of avia',
            style: TextStyle(fontSize: 27, color: Colors.white)),
        backgroundColor: Colors.black54,
        leading: const Icon(Icons.airplanemode_on),
      ),
      body: ColoredBox(
        color: Color.fromRGBO(24, 23, 27, 1.0),
        child: ListView(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  /*Positioned(
                    top: 20,
                    left: 20,
                    bottom: 20,
                    child: Image(image: AssetImage(flightRoute.map)),
                  ),*/
                  Image(image:
                  AssetImage(flightRoute.map)),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Text('Маршрут: ' + flightRoute.routeName,
                  style: TextStyle(fontSize: 30, color: Colors.white)),
              SizedBox(height: 20),
              Text(flightRoute.description, style: TextStyle(fontSize: 30, color: Colors.white)),
              SizedBox(height: 20),
              Text('Топливо: ' + flightRoute.fuel,
                  style: TextStyle(fontSize: 30, color: Colors.white)),
              SizedBox(height: 20),
              /* Stack(
            children: [
              Positioned(
                top: 20,
                left: 20,
                bottom: 20,
                child: Image(image: AssetImage('images/1.jpg')),
              ),
              // Image(image: AssetImage(AppImages.topHeader)),
              // Image(image: AssetImage(AppImages.topHeaderSubImage)),
            ],
          ),*/
              SizedBox(height: 20),
              TextButton.icon(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black12),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                  label: const Text('Вернуться назад'))
            ],
          ),
        ]),
      ),
    );
  }
}
