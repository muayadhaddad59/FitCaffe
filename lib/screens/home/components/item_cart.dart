import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_bag/getx/controller.dart';
import 'package:shop_bag/models/utlitis/shared/constants.dart';
import 'package:shop_bag/models/itemsModel.dart';
import 'package:shop_bag/models/utlitis/shared/cofigr.dart';

class ItemColumn extends StatelessWidget {
  final Items product;
  final VoidCallback press;
  const  ItemColumn({
    Key? key,
    required this.product,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FitCaffe>(
        init: FitCaffe(),
        builder: (value) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      padding: const EdgeInsets.all(kDefaultPaddin),
                      height: 180,
                      width: 160,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child:
                          Image.network("${BASE_URL + IMAGE}/${product.image}"),
                    ),
                  ),
                  Positioned(
                    top: -10,
                    right: -10,
                    child:
                        IconButton(onPressed: () {value.deleteItem(product);}, icon: const Icon(Icons.minimize)),
                  )
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
                child: Row(
                  children: [
                    Text(
                      product.title,
                      style: const TextStyle(color: kTextLightColor),
                    ),
                 const   Spacer(),
                     Text(
                      product.size,
                      style: const TextStyle(color: kTextLightColor),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                   Text(
                    "${product.price} JOD",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ), 
               const   Spacer(),
                  Row(
                    children: [
                    const  Text(
                        "Quantity:",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        product.que,
                        style:const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              )
            ],
          );
        });
  }
}
