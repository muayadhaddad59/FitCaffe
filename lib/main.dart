import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_bag/models/utlitis/shared/constants.dart';
import 'package:shop_bag/screens/home/home_screen.dart';

void main()=>runApp(const MyApp());


class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Shop",
      theme: ThemeData(
        scaffoldBackgroundColor: kBgColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: kBgColor
        ),
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: kTextColor
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home:const HomeScreen() ,
    );
  }
}