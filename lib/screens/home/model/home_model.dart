// To parse this JSON data, do
//
//     final pokeList = pokeListFromJson(jsonString);

import 'dart:convert';

List<PokeList> pokeListFromJson(String str) =>
    List<PokeList>.from(json.decode(str).map((x) => PokeList.fromJson(x)));

String pokeListToJson(List<PokeList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PokeList {
  PokeList({
    required this.number,
    required this.name,
    required this.imageUrl,
    required this.thumbnailUrl,
    this.sprites,
    this.types,
    required this.specie,
    required this.generation,
  });

  String number;
  String name;
  String imageUrl;
  String thumbnailUrl;
  Sprites? sprites;
  List<dynamic>? types;
  String specie;
  String generation;

  factory PokeList.fromJson(Map<String, dynamic> json) => PokeList(
        number: json["number"],
        name: json["name"],
        imageUrl: json["imageUrl"],
        thumbnailUrl: json["thumbnailUrl"],
        sprites:
            json["sprites"] == null ? null : Sprites.fromJson(json["sprites"]),
        types: json["types"] == null
            ? []
            : List<dynamic>.from(json["types"]!.map((x) => [x])),
        specie: json["specie"],
        generation: json["generation"],
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "name": name,
        "imageUrl": imageUrl,
        "thumbnailUrl": thumbnailUrl,
        "sprites": sprites!.toJson(),
        "types":
            types == null ? [] : List<dynamic>.from(types!.map((x) => [x])),
        "specie": specie,
        "generation": generation,
      };
}

class Sprites {
  Sprites({
    this.mainSpriteUrl,
    this.frontAnimatedSpriteUrl,
    this.backAnimatedSpriteUrl,
    this.frontShinyAnimatedSpriteUrl,
    this.backShinyAnimatedSpriteUrl,
  });

  String? mainSpriteUrl;
  String? frontAnimatedSpriteUrl;
  String? backAnimatedSpriteUrl;
  String? frontShinyAnimatedSpriteUrl;
  String? backShinyAnimatedSpriteUrl;

  factory Sprites.fromJson(Map<String, dynamic> json) => Sprites(
        mainSpriteUrl: json["mainSpriteUrl"],
        frontAnimatedSpriteUrl: json["frontAnimatedSpriteUrl"],
        backAnimatedSpriteUrl: json["backAnimatedSpriteUrl"],
        frontShinyAnimatedSpriteUrl: json["frontShinyAnimatedSpriteUrl"],
        backShinyAnimatedSpriteUrl: json["backShinyAnimatedSpriteUrl"],
      );

  Map<String, dynamic> toJson() => {
        "mainSpriteUrl": mainSpriteUrl,
        "frontAnimatedSpriteUrl": frontAnimatedSpriteUrl,
        "backAnimatedSpriteUrl": backAnimatedSpriteUrl,
        "frontShinyAnimatedSpriteUrl": frontShinyAnimatedSpriteUrl,
        "backShinyAnimatedSpriteUrl": backShinyAnimatedSpriteUrl,
      };
}
