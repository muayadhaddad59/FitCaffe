import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_bag/models/utlitis/shared/constants.dart';



  AppBar buildAppBar() {
    return AppBar(
      // backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        onPressed: () {},
        icon: SvgPicture.asset(
          "assets/icons/menu.svg",
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            "assets/icons/search.svg",
            color: Colors.white,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            "assets/icons/user-icon.svg",
            // color: kTextColor,
          ),
        ),
        const SizedBox(
          width: kDefaultPaddin / 2,
        )
      ],
    );
  }