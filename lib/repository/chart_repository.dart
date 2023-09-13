import 'package:home_project_1/models/chart.dart';

abstract class ChartRepository {
  Future<List<Chart>> getCharts();
}

class MockChartRepository extends ChartRepository {
  @override
  Future<List<Chart>> getCharts() {
    return Future.delayed(
        Duration(seconds: 10),
        () => [
              Chart(
                  1,
                  'LOWI/INN',
                  'INNSBRUCK, INNSBRUCK, Austria',
                  '26.05.2023',
                  '47°15’37.1"N  011°20’38.0"E',
                  '6500 ft (1981 m)'),
              Chart(2, 'LDDU/DBV', 'CILIPI, DUBROVNIK, Croatia', '26.05.2023',
                  '42°33’41.0"N  018°16’5.5"E', '10500 ft (3200 m)'),
              Chart(
                  3,
                  'HESH/SSH',
                  'SHARM EL SHEIKH INTL, SHARM EL SHEIKH, Egypt',
                  '26.05.2023',
                  '27°58’43.0"N  034°23’35.9"E',
                  '10100 ft (3078 m)'),
              Chart(
                  4,
                  'KLAS/LAS',
                  'REID INTL LAS VEGAS NV United States',
                  '26.05.2023',
                  '36°4’48.0"N  115°9’7.2"W',
                  '14500 ft (4420 m)'),
              Chart(5, 'UHMP/PWE', 'PEVEK PEVEK Russia', '26.05.2023',
                  '69°46’59.9"N  170°35’49.2"E', '7200 ft (2195 m)'),
              Chart(
                  6,
                  'MDPC/PUJ',
                  'PUNTA CANA INTL, HIGUEY, Dominican Republic',
                  '26.05.2023',
                  '18°34’14.9"N  068°21’58.3"W',
                  '10100 ft (3078 m)'),
              Chart(7, 'LTFM/IST', 'ISTANBUL, ISTANBUL, Turkey', '26.05.2023',
                  '41°16’31.1"N  028°45’6.8"E', '13400 ft (4084 m)'),
              Chart(
                  8,
                  'LTAC/ESB',
                  'ESENBOGA INTL, ANKARA, Turkey',
                  '26.05.2023',
                  '40°7’41.2"N  032°59’42.0"E',
                  '12300 ft (3749 m)'),
              Chart(9, 'LIRF/FCO', 'FIUMICINO, ROME, Italy', '26.05.2023',
                  '41°48’1.1"N  012°14’20.0"E', '12800 ft (3901 m)')
            ]);
  }
}
