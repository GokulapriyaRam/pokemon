import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:searchfield/searchfield.dart';
import 'package:task_e2/core/color.dart';
import 'package:task_e2/core/common_methods.dart';
import 'package:task_e2/core/routes/route_strings.dart';
import 'package:task_e2/screens/home/provider/home_provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> with CommonMethods {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<HomeProvider>(
      builder: (context, home, child) => Scaffold(
        appBar: commonAppBar('Pokemons'),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.02,
              ),
              SearchField(
                controller: home.textAheadController,
                searchInputDecoration: InputDecoration(
                  filled: true,
                  border: InputBorder.none,
                  fillColor: AppColors.white,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: AppColors.grey)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: AppColors.grey)),
                ),
                itemHeight: size.height * 0.2,
                onSubmit: (newValue) {
                  setState(() {});
                },
                hint: "Search Pokemon",
                suggestions: home.pokeList.map((values) {
                  dynamic poke = values;
                  return SearchFieldListItem(poke.name,
                      child: ListView.builder(
                        itemCount: home.pokeList.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemBuilder: ((context, index) {
                          return InkWell(
                            onTap: () {
                              home.homeIndex = index;
                              moveTo(context, AppRoutes.viewPokemon);
                            },
                            child: listContainer(size, poke.imageUrl,
                                poke.number, poke.name, poke.types!.first[0]),
                          );
                        }),
                      ));
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
