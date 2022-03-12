import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shop_bag/getx/controller.dart';
import 'package:http/http.dart' as http;

class UploadScreen extends StatefulWidget {
  const UploadScreen({Key? key}) : super(key: key);

  @override
  _UploadScreenState createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController queController = TextEditingController();
  TextEditingController sizeController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  String category = "Category";
  String selectCategory = "0";

  File? _image;
  final picker = ImagePicker();
  Future choiceImage() async {
    var pickedImage = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = File(pickedImage!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FitCaffe>(
        init: FitCaffe(),
        builder: (value) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
            ),
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    minRadius: 150,
                    child: Stack(
                      children: [
                        Align(
                            alignment: Alignment.center,
                            child: _image == null
                                ? const FlutterLogo(
                                    size: 200,
                                  )
                                : Image.file(
                                    _image!,
                                    width: 100,
                                    height: 100,
                                  )),
                        Positioned(
                          top: -12,
                          right: 40,
                          child: IconButton(
                            onPressed: () => choiceImage(),
                            icon: const Icon(Icons.add_circle),
                            iconSize: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  buildTextField(
                      hintText: "Name", name: nameController, isNumber: false),
                  const SizedBox(
                    height: 10,
                  ),
                  buildTextField(hintText: "Quantity", name: queController),
                  const SizedBox(
                    height: 10,
                  ),
                  buildTextField(hintText: "Size", name: sizeController ,isNumber: false),
                  const SizedBox(
                    height: 10,
                  ),
                  buildTextField(hintText: "Price", name: priceController),
                  const SizedBox(
                    height: 10,
                  ),
                  buildDropBox(),
                  ElevatedButton(
                      onPressed: () {
                        value.uploadImage(
                            nameController,
                            _image!.path,
                            selectCategory,
                            queController.text,
                            sizeController.text,
                            priceController.text);
                        Get.back();
                      },
                      child: const Text("Submit"))
                ],
              ),
            ),
          );
        });
  }

  DropdownButton<String> buildDropBox() {
    return DropdownButton<String>(
      hint: Text(
        category,
        style: const TextStyle(color: Colors.white),
      ),
      iconDisabledColor: Colors.white,
      iconEnabledColor: Colors.white,
      dropdownColor: Colors.white,
      focusColor: Colors.white,
      style: const TextStyle(color: Colors.black),
      items: <String>['Hot Drinks', 'Cold Drinks', 'Chips&Bars', 'Sandwiches']
          .map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (_) {
        category = _.toString();

        switch (_) {
          case "Hot Drinks":
            setState(() {
              selectCategory = "0";
            });
            break;

          case "Cold Drinks":
            setState(() {
              selectCategory = "1";
            });
            break;

          case "Chips&Bars":
            setState(() {
              selectCategory = "2";
            });
            break;

          case "Sandwiches":
            setState(() {
              selectCategory = "3";
            });
            break;
          default:
        }
      },
    );
  }

  Container buildTextField(
      {required String? hintText,
      required TextEditingController name,
      bool isNumber = true}) {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          keyboardType: isNumber ? TextInputType.number : TextInputType.name,
          controller: name,
          style: const TextStyle(color: Colors.black),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "$hintText",
            hintStyle: const TextStyle(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
