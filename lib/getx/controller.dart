import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shop_bag/models/itemsModel.dart';
import 'package:shop_bag/models/utlitis/shared/cofigr.dart';
import 'package:http/http.dart' as http;

class FitCaffe extends GetxController {
  // TODO: add function
  int selecrtedIndex = 0;
  List pro = [];
//  @override
//   void onInit() {
//     // TODO: implement onInit
//     super.onInit();
//     pro = products
//         .where((element) => element.categoryid == 0)
//         .toList();

//   }
  void changeIndex(int index) {
    selecrtedIndex = index;

    update();
  }

// This for get Item

  Future<List<Items>> getItemList() async {
    var url = Uri.parse(BASE_URL + VIEW_ITEM);

    final response =
        await http.post(url, body: {"numberList": selecrtedIndex.toString()});
    print(response.body);
    final items = json.decode(response.body).cast<Map<String, dynamic>>();
    List<Items> students = items.map<Items>((json) {
      return Items.fromJson(json);
    }).toList();
    print(students[0].title);
    return students;
  }

  Future uploadImage(
      TextEditingController text, String? _image, String numberList ,String que , String size , String price) async {
    try {
      final uri = Uri.parse(BASE_URL + UPLOAD_ITEMS);
      var request = http.MultipartRequest("POST", uri);
      request.fields["title"] = text.text;
      request.fields["numberList"] = numberList;
      request.fields["que"] = que ;
      request.fields["price"] = price;
      request.fields["size"] = size;
      var pic = await http.MultipartFile.fromPath("image", _image!);
      request.files.add(pic);
      var response = await request.send();

      if (response.statusCode == 200) {
        print("Image Uploaded");
        print(response.request);
      } else {
        print("Image Not Uploaded");
      }
      update();
    } catch (error) {
      print(error);
    }
  }

  void deleteItem(Items data) {
    var url = BASE_URL + DELETE_ITEMS;
    http.post(Uri.parse(url),
        body: {'id': data.id, 'image': IMAGE + data.image});
        update();
  }
}
