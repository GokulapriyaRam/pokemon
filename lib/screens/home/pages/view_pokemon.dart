import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:task_e2/core/color.dart';
import 'package:task_e2/core/common_methods.dart';
import 'package:task_e2/screens/home/provider/home_provider.dart';

class ViewPokemon extends StatefulWidget {
  const ViewPokemon({Key? key}) : super(key: key);

  @override
  State<ViewPokemon> createState() => _ViewPokemonState();
}

class _ViewPokemonState extends State<ViewPokemon> with CommonMethods {
  @override
  void initState() {
    // TODO: implement initState
    var home = Provider.of<HomeProvider>(context, listen: false);
    home.data = home.pokeList[home.homeIndex];
    home.fetchPokemonDetails(context: context, num: home.data!.number);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<HomeProvider>(
      builder: (context, home, child) => home.data != null
          ? Scaffold(
              appBar: commonAppBar(home.data!.name),
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.height * 0.02),
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(home.data!.imageUrl),
                        Text(
                          'Pokemon Types :',
                          style: textStyleTwo(),
                        ),
                        SizedBox(
                          height: size.height * 0.005,
                        ),
                        Text(
                          '${home.data!.types!.first[0]}',
                          style: textStyleOne(),
                        ),
                        if (home.data!.types!.length > 1)
                          Text(
                            '${home.data!.types!.last[0]}',
                            style: textStyleOne(),
                          ),
                        SizedBox(
                          height: size.height * 0.015,
                        ),
                        Text(
                          'Description :',
                          style: textStyleTwo(),
                        ),
                        SizedBox(
                          height: size.height * 0.005,
                        ),
                        Text(
                          home.details != null
                              ? home.details!.descriptions!.first
                              : 'No description',
                          style: textStyleOne(),
                        ),
                        SizedBox(
                          height: size.height * 0.015,
                        ),
                        Text(
                          'Pokemon Base States :',
                          style: textStyleTwo(),
                        ),
                        SizedBox(
                          height: size.height * 0.005,
                        ),
                        Text(
                          home.details != null
                              ? 'Attack : ${home.details!.baseStats!.attack}'
                              : 'Attack : 0',
                          style: textStyleOne(),
                        ),
                        Text(
                          home.details != null
                              ? 'Defense : ${home.details!.baseStats!.defense}'
                              : 'Defense : 0',
                          style: textStyleOne(),
                        ),
                        Text(
                          home.details != null
                              ? 'Hp : ${home.details!.baseStats!.hp}'
                              : 'Hp : 0',
                          style: textStyleOne(),
                        ),
                        Text(
                          home.details != null
                              ? 'SpAtk : ${home.details!.baseStats!.spAtk}'
                              : 'SpAtk : 0',
                          style: textStyleOne(),
                        ),
                        Text(
                          home.details != null
                              ? 'SpDef : ${home.details!.baseStats!.spDef}'
                              : 'SpDef : 0',
                          style: textStyleOne(),
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Text(
                          'Pokemon Cards :',
                          style: textStyleTwo(),
                        ),
                        SizedBox(
                          height: size.height * 0.005,
                        ),
                        SizedBox(
                          height: size.height,
                          child: ListView.builder(
                            itemCount: home.details!.cards.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemBuilder: ((context, index) {
                              return Image.network(
                                  '${home.details!.cards[index].imageUrl}');
                            }),
                          ),
                        ),
                      ]),
                ),
              ),
            )
          : Scaffold(),
    );
  }
}
