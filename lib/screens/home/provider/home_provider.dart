import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:task_e2/core/common_methods.dart';
import 'package:task_e2/screens/home/model/detail_model.dart';
import 'package:task_e2/screens/home/model/home_model.dart';
import 'package:task_e2/screens/home/repository/home_repository.dart';

class HomeProvider extends HomeRepository with ChangeNotifier, CommonMethods {
  List pokeList = [];
  int homeIndex = 0;
  PokeList? data;
  PokeDetailList? details;
  TextEditingController textAheadController = TextEditingController();

  fetchPokemon({required BuildContext context}) async {
    pokeList = await getPokemons(context: context);

    notifyListeners();
  }

  fetchPokemonDetails(
      {required BuildContext context, required String num}) async {
    // showLoaderButton(context, 'Plase Wait');
    details = await getPokemonDetails(context: context, number: num);
    // back(context);
    notifyListeners();
  }
}
