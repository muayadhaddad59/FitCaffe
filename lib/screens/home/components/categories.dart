
  import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_bag/models/utlitis/shared/constants.dart';
import 'package:shop_bag/getx/controller.dart';
import 'package:shop_bag/models/utlitis/category_dara.dart';

class Categories extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FitCaffe>(
      init: FitCaffe(),
      builder: (value){
      return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: SizedBox(
        height: 25,
        child: ListView.builder(
          itemCount: categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            return buildCategory(index);
          },
        ),
      ),
    );
    });
  }

  Widget buildCategory(int index) {
    return GetBuilder<FitCaffe>(
      init: FitCaffe(),
      builder: (value){
      return GestureDetector(
       onTap: () {
         value.changeIndex(index);
        },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              categories[index].name,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color:
                      value.selecrtedIndex == index ? kTextLightColor:kTextColor ),
            ),
            Container(
              margin: const EdgeInsets.only(top: kDefaultPaddin / 4),
              height: 2,
              width: 30,
              color:
                  value.selecrtedIndex == index ? Colors.black : Colors.transparent,
            )
          ],
        ),
      ),
    );
    });
  }
}
