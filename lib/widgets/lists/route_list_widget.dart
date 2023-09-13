import 'package:flutter/material.dart';

import '../../details/route_details.dart';

class FlightRoute {
  String _routeName;
  String _description;
  String _date;
  String _fuel;
  String _map;

  FlightRoute(this._routeName, this._description, this._date, this._fuel, this._map);

  String get description => _description;

  String get routeName => _routeName;

  String get date => _date;

  String get fuel => _fuel;

  String get map => _map;
}

class FlightRoutesListWidget extends StatefulWidget {
  @override
  _FlightRoutesListState createState() => _FlightRoutesListState();
}

class _FlightRoutesListState extends State<FlightRoutesListWidget> {
  final List<FlightRoute> _flightRoutes = [
    FlightRoute('UNKL-UUEE', 'для Airbus A320', '26.05.2023',
        '1000 kg', 'images/1.jpg'),
    FlightRoute(
        'LTAI-VIDP', 'для Boeing 737-800', '26.05.2023', '1200 kg', 'images/2.jpg'),
    FlightRoute(
        'UUEE-OMDB', 'для Boeing 747-400', '26.05.2023', '800 kg', 'images/3.jpg'),
    FlightRoute('LGAV-LGIR', 'для Embraer 145', '26.05.2023', '900 kg', 'images/4.jpg'),
    FlightRoute('LOVI-LFMN', 'для Airbus A320', '26.05.2023', '1500 kg', 'images/5.jpg'),
    FlightRoute('ULLI-UUWW', 'для Airbus A300B4-600', '26.05.2023', '790 kg', 'images/6.jpg'),
    FlightRoute('UUWW-URSS', 'для Tupolev 154', '26.05.2023', '110 kg', 'images/7.jpg'),
    FlightRoute('USTR-USRR', 'для Airbus A320', '26.05.2023', '1200 kg', 'images/8.jpg'),
    FlightRoute('UHHH-UHWW', 'для Airbus A321', '26.05.2023', '1600 kg', 'images/9.jpg')
  ];

  var _filteredFlightRoutes = <FlightRoute>[];

  final _searchController = TextEditingController();

  void _searchFlightRoutes() {
    final query = _searchController.text;
    if (query.isNotEmpty) {
      _filteredFlightRoutes = _flightRoutes.where((FlightRoute flightRoute) {
        return flightRoute.routeName.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      _filteredFlightRoutes = _flightRoutes;
    }
    setState(() {});
  }

  @override
  void initState() {
    _searchFlightRoutes();
    super.initState();
    _searchController.addListener(_searchFlightRoutes);
  }

  void _onRouteTap(int index) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => FlightRouteInfo(flightRoute: _flightRoutes[index],)
    )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      ListView.builder(
          padding: EdgeInsets.only(top: 70),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          itemCount: _filteredFlightRoutes.length,
          itemExtent: 163,
          itemBuilder: (BuildContext context, int index) {
            final flightRoute = _flightRoutes[index];
            return Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Stack(children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 10),
                    decoration: BoxDecoration(
                      //color: Colors.white,
                        border:
                        Border.all(color: Colors.black.withOpacity(0.2)),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
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
                                flightRoute.date,
                                style: TextStyle(color: Colors.grey),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(width: 5, height: 25),
                              Text(
                                flightRoute.routeName,
                                style: TextStyle(fontWeight: FontWeight.bold),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(width: 20, height: 15,),
                              Text(flightRoute.description,
                                  maxLines: 2, overflow: TextOverflow.ellipsis)
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
                      onTap: () => _onRouteTap(index),
                    ),
                  )
                ]));
          }),
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