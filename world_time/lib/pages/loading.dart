import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void getTime() async {
    Response response = await get(
      Uri.parse(
        'https://timeapi.io/api/time/current/zone?timeZone=Europe%2FLondon',
      ),
    );
    Map data = jsonDecode(response.body);
    String datetime = data['dateTime'];
    DateTime now = DateTime.parse(datetime);
    print(now);
  }

  @override
  void initState() {
    super.initState();
    getTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Text('Loading Screen'));
  }
}
