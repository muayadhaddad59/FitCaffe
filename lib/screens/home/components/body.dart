import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_bag/models/utlitis/shared/constants.dart';
import 'package:shop_bag/getx/controller.dart';
import 'package:shop_bag/models/itemsModel.dart';
import 'package:shop_bag/screens/home/components/categories.dart';
import 'package:shop_bag/models/utlitis/shared/cofigr.dart';

import 'item_cart.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FitCaffe>(
        init: FitCaffe(),
        builder: (value) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
                child: Text(
                  "FIT CAFE",
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.grey.shade400),
                ),
              ),
              Categories(),
              FutureBuilder(
                  future: value.getItemList(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: kDefaultPaddin),
                          child: GridView.builder(
                            itemCount: snapshot.data.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 0.64,
                                    crossAxisSpacing: 10),
                            itemBuilder: (_, index) {
                              Items data = snapshot.data[index];
                              if (snapshot.data.length == null) {
                                return const Center(
                                  child: Text("There is no data!"),
                                );
                              } else {
                                return ItemColumn(
                                  product: data,
                                  press: () {},
                                );
                              }
                            },
                          ),
                        ),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
                  
            ],
          );
        });
  }
}
