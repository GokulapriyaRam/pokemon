import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:searchfield/searchfield.dart';
import 'package:task_e2/core/color.dart';
import 'package:task_e2/core/common_methods.dart';
import 'package:task_e2/core/routes/route_strings.dart';
import 'package:task_e2/screens/home/model/home_model.dart';
import 'package:task_e2/screens/home/provider/home_provider.dart';
import 'package:task_e2/screens/home/repository/home_repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with CommonMethods {
  @override
  void initState() {
    // TODO: implement initState
    var home = Provider.of<HomeProvider>(context, listen: false);
    home.fetchPokemon(context: context);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: commonAppBar('Pokemon List'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
        child: Consumer<HomeProvider>(
          builder: (context, home, child) => SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: size.height * 0.02,
                ),
                InkWell(
                  onTap: () {
                    moveTo(context, AppRoutes.searchPage);
                  },
                  child: Container(
                    height: size.height * 0.06,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColors.lightgrey),
                    padding: EdgeInsets.all(size.height * 0.01),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.search,
                          color: AppColors.primary,
                          size: 30,
                        ),
                        Text(
                          "Search",
                          style: TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                // home.pokeList.isNotEmpty
                //     ?
                SizedBox(
                  height: size.height,
                  child: ListView.builder(
                    itemCount: home.pokeList.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: ((context, index) {
                      home.data = home.pokeList[index];
                      return InkWell(
                        onTap: () {
                          home.homeIndex = index;

                          moveTo(context, AppRoutes.viewPokemon);
                        },
                        child: listContainer(
                            size,
                            home.data!.imageUrl,
                            home.data!.number,
                            home.data!.name,
                            home.data!.types!.first[0]),
                      );
                    }),
                  ),
                )
                // : Container()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
