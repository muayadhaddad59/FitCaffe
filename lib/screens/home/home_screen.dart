import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shop_bag/models/utlitis/shared/constants.dart';
import 'package:shop_bag/screens/home/components/body.dart';
import 'package:shop_bag/screens/upload_screen.dart/upload_screen.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'components/build_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(const UploadScreen());
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.blueGrey,
      ),
      body:const Body(),
    );
  }

}
