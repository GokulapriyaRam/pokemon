import 'package:flutter/material.dart';
import 'package:task_e2/core/color.dart';

import 'enum.dart';

mixin CommonMethods {
  moveTo(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }

  back(BuildContext context) {
    Navigator.pop(context);
  }

  Uri stringToUri({required String urlPath}) {
    return Uri.parse(urlPath);
  }

  TextStyle textStyleOne() {
    return const TextStyle(
        color: AppColors.black, fontSize: 18, fontWeight: FontWeight.bold);
  }

  TextStyle textStyleTwo() {
    return const TextStyle(
        color: AppColors.grey, fontSize: 16, fontWeight: FontWeight.bold);
  }

  AppBar commonAppBar(String name) {
    return AppBar(
      backgroundColor: AppColors.primary,
      title: Text(
        "$name",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
    );
  }

  Padding listContainer(
      Size size, String networkImage, String name, String number, generation) {
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: textStyleOne(),
                ),
                Text(
                  number,
                  style: textStyleOne(),
                ),
                SizedBox(height: size.height * 0.01),
                Text(
                  "Pokemon Type : $generation",
                  style: textStyleTwo(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  getSnackbar(BuildContext context, ResponseType responseType, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: responseType == ResponseType.success
          ? AppColors.lightgrey
          : AppColors.red,
      content: Text(
        message,
        style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: responseType == ResponseType.success
                ? AppColors.black
                : AppColors.white),
      ),
      duration: const Duration(seconds: 2),
      dismissDirection: DismissDirection.up,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      // margin: EdgeInsets.only(
      //     bottom: size.height * 0.9,
      //     right: size.width * 0.01,
      //     left: size.width * 0.01),
    ));
  }

  void showLoaderButton(BuildContext context, String message) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => true,
          child: SimpleDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            children: <Widget>[
              Center(
                child: Column(
                  children: [
                    const CircularProgressIndicator(
                      strokeWidth: 2,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      message,
                      style: const TextStyle(),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
