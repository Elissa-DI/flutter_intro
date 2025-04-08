import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {
  late String location;
  late String time;
  late String flag;
  late String url;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      Response response = await get(
        Uri.parse('https://timeapi.io/api/time/current/zone?timeZone=$url'),
      );
      Map data = jsonDecode(response.body);
      String datetime = data['dateTime'];
      DateTime now = DateTime.parse(datetime);

      time = now.toString();
    } catch (e) {
      print('Caught error: $e');
      time = 'Time can\'t be set';
    }
  }
}

WorldTime instance = WorldTime(
  location: 'Berlin',
  flag: 'germany.png',
  url: 'Europe/Berlin',
);
