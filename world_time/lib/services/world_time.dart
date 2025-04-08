import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  late String location;
  late String time;
  late String flag;
  late String url;
  late bool isDaytime;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      Response response = await get(
        Uri.parse('https://timeapi.io/api/time/current/zone?timeZone=$url'),
      );
      Map data = jsonDecode(response.body);
      String datetime = data['dateTime'];
      DateTime now = DateTime.parse(datetime);

      isDaytime = now.hour >= 6 && now.hour < 18;
      time = DateFormat.jm().format(now);
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
