import 'package:flutter/material.dart';
import 'package:worldtime/services/covidResult.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<CovidResult> locations = [
    CovidResult(url: 'malaysia', location: 'Malaysia', flag: 'malaysia.png'),
    CovidResult(
        url: 'usa', location: 'United States of America', flag: 'america.png'),
    CovidResult(url: 'uk', location: 'United Kingdom', flag: 'uk.png'),
    CovidResult(url: 'germany', location: 'Germany', flag: 'germany.png'),
    CovidResult(url: 'brazil', location: 'Brazil', flag: 'brazil.png'),
    CovidResult(url: 'russia', location: 'Russia', flag: 'russia.png'),
    CovidResult(url: 'france', location: 'France', flag: 'france.png'),
    CovidResult(url: 'singapore', location: 'Singapore', flag: 'singapore.png'),
    CovidResult(url: 'india', location: 'India', flag: 'india.png'),
  ];

  void updateTime(index) async {
    CovidResult instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'url': instance.url,
      'todayCases': instance.todayCases,
      'totalCases': instance.totalCases,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          backgroundColor: Colors.lightBlue[900],
          title: Text('Choose a Location'),
          centerTitle: true,
          elevation: 0,
        ),
        body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
              child: Card(
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
