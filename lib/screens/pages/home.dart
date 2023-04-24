import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_e2/core/color.dart';
import 'package:task_e2/core/common_methods.dart';
import 'package:task_e2/screens/home_model.dart';
import 'package:task_e2/screens/provider/home_provider.dart';

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
    home.fetchPokemon();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text(
          "Pokemon List",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
        child: Consumer<HomeProvider>(
          builder: (context, home, child) => Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: size.height * 0.02,
              ),
              Container(
                height: size.height * 0.8,
                child: ListView.builder(
                  itemCount: home.pokeList.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: ((context, index) {
                    PokeList data = home.pokeList[index];
                    print("data here ${data.imageUrl}");
                    return listContainer(
                        size, data.imageUrl, data.number, data.name);
                  }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding listContainer(
      Size size, String networkImage, String name, String number) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        height: size.height * 0.15,
        width: size.width * 1,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size.height * 0.05),
          color: AppColors.primary,
        ),
        child: Row(
          children: [
            Image.network(networkImage),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$name",
                  style: textStyleOne(),
                ),
                Text(
                  "$number",
                  style: textStyleOne(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
