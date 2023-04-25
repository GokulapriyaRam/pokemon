import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:task_e2/core/common_methods.dart';
import 'package:task_e2/core/enum.dart';
import 'package:task_e2/screens/home/model/detail_model.dart';
import 'package:task_e2/screens/home/model/home_model.dart';

class HomeRepository with CommonMethods {
  getPokemons({required BuildContext context}) async {
    try {
      http.Response response = await http.get(
          stringToUri(
              urlPath: 'https://pokedex.alansantos.dev/api/pokemons.json'),
          headers: {
            'Content-type': 'application/json',
            'Accept': 'application/json'
          });
      final data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return pokeListFromJson(response.body);
      } else {
        getSnackbar(context, ResponseType.failed, 'Something went wrong');
      }
    } catch (e) {
      getSnackbar(context, ResponseType.failed, '$e');
    }
  }

  getPokemonDetails({required BuildContext context, required String number}) async {
    try {
      http.Response response = await http.get(
          stringToUri(
              urlPath:
                  'https://pokedex.alansantos.dev/api/pokemons/$number.json'),
          headers: {
            'Content-type': 'application/json',
            'Accept': 'application/json'
          });
      final data = jsonDecode(response.body);
     
      if (response.statusCode == 200) {
        return pokeDetailListFromJson(response.body);
      } else {
        getSnackbar(context, ResponseType.failed, 'Something went wrong');
      }
    } catch (e) {
      getSnackbar(context, ResponseType.failed, '$e');
    }
  }
}
