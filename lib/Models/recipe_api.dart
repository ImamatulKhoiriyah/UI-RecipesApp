import 'dart:convert';
import 'package:recipeapp/Models/recipe.dart';
import 'package:http/http.dart' as http;

class ResepApi {
  static Future<List<Resep>> getResep() async {
    var uri = Uri.https('tasty.p.rapidapi.com', '/recipes/list', {
      "from": "0",
      "size": "20",
      "tags": "under_30_minutes"
    });

    final response = await http.get(uri, headers: {
      "X-RapidAPI-Key": "16a5573e62msh2d6189855522db3p1b31b8jsn614477b871b0",
      "X-RapidAPI-Host": "tasty.p.rapidapi.com"
    });

    Map data = jsonDecode(response.body);

    List _temp = [];

    for (var i in data['results']) {
      _temp.add(i);
    }

    return Resep.resepFromSnapshot(_temp);
  }
}
