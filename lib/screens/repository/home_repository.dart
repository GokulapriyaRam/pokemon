import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:task_e2/core/common_methods.dart';
import 'package:task_e2/screens/home_model.dart';

class HomeRepository with CommonMethods {
  getPokemons() async {
    try {
      http.Response response = await http.get(
          stringToUri('https://pokedex.alansantos.dev/api/pokemons.json'),
          headers: {
            'Content-type': 'application/json',
            'Accept': 'application/json'
          });
      final data = jsonDecode(response.body);
      print("data $data");
      if (response.statusCode == 200) {
        return pokeListFromJson(response.body);
      } else {
        print("something went wrong");
      }
    } catch (e) {
      print("e");
    }
  }
}
