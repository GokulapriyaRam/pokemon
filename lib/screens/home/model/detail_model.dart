// To parse this JSON data, do
//
//     final pokeDetailList = pokeDetailListFromJson(jsonString);

import 'dart:convert';

PokeDetailList pokeDetailListFromJson(String str) =>
    PokeDetailList.fromJson(json.decode(str));

String pokeDetailListToJson(PokeDetailList data) => json.encode(data.toJson());

class PokeDetailList {
  PokeDetailList({
    this.number,
    this.name,
    this.imageUrl,
    this.types,
    this.descriptions,
    this.baseStats,
   required this.cards,
  });

  String? number;
  String? name;
  String? imageUrl;
  List<dynamic>? types;
  List<String>? descriptions;
  BaseStats? baseStats;
  List<Card> cards;

  factory PokeDetailList.fromJson(Map<String, dynamic> json) => PokeDetailList(
        number: json["number"],
        name: json["name"],
        imageUrl: json["imageUrl"],
        types: json["types"] == null
            ? []
            : List<dynamic>.from(json["types"]!.map((x) => [x])),
        descriptions: json["descriptions"] == null
            ? []
            : List<String>.from(json["descriptions"]!.map((x) => x)),
        baseStats: json["baseStats"] == null
            ? null
            : BaseStats.fromJson(json["baseStats"]),
        cards: json["cards"] == null
            ? []
            : List<Card>.from(json["cards"]!.map((x) => Card.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "name": name,
        "imageUrl": imageUrl,
        "types":
            types == null ? [] : List<dynamic>.from(types!.map((x) => [x])),
        "descriptions": descriptions == null
            ? []
            : List<dynamic>.from(descriptions!.map((x) => x)),
        "baseStats": baseStats?.toJson(),
        "cards": cards == null
            ? []
            : List<dynamic>.from(cards.map((x) => x.toJson())),
      };
}

class BaseStats {
  BaseStats({
    this.hp,
    this.attack,
    this.defense,
    this.spAtk,
    this.spDef,
    this.speed,
    this.total,
  });

  int? hp;
  int? attack;
  int? defense;
  int? spAtk;
  int? spDef;
  int? speed;
  int? total;

  factory BaseStats.fromJson(Map<String, dynamic> json) => BaseStats(
        hp: json["hp"],
        attack: json["attack"],
        defense: json["defense"],
        spAtk: json["spAtk"],
        spDef: json["spDef"],
        speed: json["speed"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "hp": hp,
        "attack": attack,
        "defense": defense,
        "spAtk": spAtk,
        "spDef": spDef,
        "speed": speed,
        "total": total,
      };
}

class Card {
  Card({
    this.number,
    this.name,
    this.expansionName,
    this.imageUrl,
  });

  String? number;
  String? name;
  String? expansionName;
  String? imageUrl;

  factory Card.fromJson(Map<String, dynamic> json) => Card(
        number: json["number"],
        name: json["name"],
        expansionName: json["expansionName"],
        imageUrl: json["imageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "name": name,
        "expansionName": expansionName,
        "imageUrl": imageUrl,
      };
}
