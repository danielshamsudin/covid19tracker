// ignore: avoid_web_libraries_in_flutter
import 'package:http/http.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:worldtime/services/covidResult.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupCovidResult() async {
    CovidResult instance = CovidResult(
        location: 'Malaysia', flag: 'malaysia.png', url: 'malaysia');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'url': instance.url,
      'todayCases': instance.todayCases,
      'totalCases': instance.totalCases,
    });
  }

  @override
  void initState() {
    super.initState();
    setupCovidResult();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1f1f1f),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitFadingCircle(
              color: Colors.white,
              size: 80.0,
            ),
            Text(
              'Loading',
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
