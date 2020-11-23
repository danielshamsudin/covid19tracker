import 'package:http/http.dart';
import 'dart:convert';

class CovidResult {
  String location; //location chosen
  String flag; // link to asset
  String url; // url to covid19 API endpoint
  String todayCases;
  String totalCases;

  CovidResult(
      {this.location, this.flag, this.url, this.todayCases, this.totalCases});

  Future<void> getTime() async {
    try {
      Response response =
          await get('https://coronavirus-19-api.herokuapp.com/countries/$url');
      Map data = jsonDecode(response.body);
//      todayCases = data['todayCases'];
      // get properties from data
      //String country = data['country'];
      String casesNow = data['todayCases'].toString();
      String currCase = data['cases'].toString();
      todayCases = casesNow;
      totalCases = currCase;

      // print(country + ' :' + casesNow + '\n total Case: ' + currCase);
    } catch (e) {
      print('catched exception: $e');
      location = 'location not found';
    }
  }
}
