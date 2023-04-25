import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_e2/core/routes/route_strings.dart';
import 'package:task_e2/core/routes/routes.dart';
import 'package:task_e2/screens/home/pages/home.dart';
import 'package:task_e2/screens/home/provider/home_provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<HomeProvider>(create: (_) => HomeProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.initial,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
