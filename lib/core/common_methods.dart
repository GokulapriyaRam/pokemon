import 'package:flutter/material.dart';
import 'package:task_e2/core/color.dart';

mixin CommonMethods {
  moveTo(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }

  stringToUri(String url) {
    Uri.parse(url);
  }
   TextStyle textStyleOne() {
    return TextStyle(
                color: AppColors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold);
  }
}
