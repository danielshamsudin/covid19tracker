import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    //set bg
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'CoVID-19 Tracker',
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[900],
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/bgbg.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(
              children: [
                FlatButton.icon(
                  onPressed: () async {
                    dynamic result =
                        await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = {
                        'location': result['location'],
                        'todayCases': result['todayCases'],
                        'totalCases': result['totalCases'],
                      };
                    });
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.grey[300],
                  ),
                  label: Text(
                    'Change Location',
                    style: TextStyle(
                      color: Colors.grey[300],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['location'],
                      style: TextStyle(
                          color: Colors.white, fontSize: 28, letterSpacing: 2),
                    ),
                  ],
                ),
                SizedBox(
                  height: 19,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Today: ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        letterSpacing: 2,
                      ),
                    ),
                    Text(
                      data['todayCases'].toString(),
                      style: TextStyle(
                        color: Colors.red[400],
                        fontSize: 24,
                        letterSpacing: 2,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Total Cases: ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        letterSpacing: 2,
                      ),
                    ),
                    Text(
                      data['totalCases'].toString(),
                      style: TextStyle(
                        color: Colors.red[400],
                        fontSize: 24,
                        letterSpacing: 2,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//TODO: add text indicator of (today cases, total cases, total death)
//TODO: fetch total death from API
