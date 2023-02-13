import 'dart:convert';
import 'data_model.dart';
import 'package:http/http.dart' as http;

class Dataservices {
  String baseurl = "http://mark.bslmeiyu.com/api";
  Future<List<DataModel>> getInfo() async {
    var apiUrl = "/getplaces";
    http.Response res = await http.get(Uri.parse(baseurl + apiUrl));
    try {
      if (res.statusCode == 200) {
        List<dynamic> list = json.decode(res.body);
        return list.map((e) => DataModel.fromJsom(e)).toList();
      } else {
        return <DataModel>[]; //empty
      }
    } catch (e) {
      print(e);
      return <DataModel>[]; //empty
    }
  }
}
