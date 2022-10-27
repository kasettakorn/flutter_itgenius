// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_scale/components/custom_widgets.dart';
import 'package:flutter_scale/models/ProductsModel.dart';
import 'package:flutter_scale/services/rest_api.dart';
import 'package:flutter_scale/utils/utility.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final formKey = GlobalKey<FormState>();

  String? productName,
      productDetail,
      productBarcode,
      productPrice,
      productQty,
      productImage;

  void addProduct() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      if (await Utility.getInstance()!.checkNetworkConnection() == '') {
        Utility.getInstance()!.showAlertDialog(
            context, 'เกิดข้อผิดพลาด', 'ไม่พบการเชื่อมต่อเครือข่าย');
      } else {
        ProductsModel productsModel = ProductsModel(
          productDetail: productDetail.toString(),
          productName: productName.toString(),
          productBarcode: productBarcode.toString(),
          productQty: productQty.toString(),
          productPrice: productPrice.toString(),
          productImage: productImage.toString(),
        );

        var response = await CallAPI().createProduct(productsModel);

        if (response) {
          Navigator.pop(context);
        } else {
          Utility.getInstance()!.showAlertDialog(context, 'เกิดข้อผิดพลาด',
              'ไม่สามารถเพิ่มสินค้าได้ กรุณาลองอีกครั้ง');
        }
      }
    } else {
      Utility.getInstance()!.showAlertDialog(
          context, 'เกิดข้อผิดพลาด', 'กรุณากรอกข้อมูลให้ครบถ้วน');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('เพิ่มสินค้าใหม่'),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width - 120,
                child: i(
                    context, Icon(Icons.shopping_cart), 'ชื่อสินค้า',
                    (onValidateValue) {
                  if (onValidateValue!.isEmpty) {
                    return 'กรุณาป้อนชื่อสินค้า';
                  } else {
                    return null;
                  }
                }, (onSaveValue) {
                  productName = onSaveValue;
                }),
              ),
              SizedBox(height: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width - 120,
                child: inputFieldWidget(
                  context,
                  Icon(Icons.list_alt_outlined),
                  'รายละเอียดสินค้า',
                  (onValidateValue) {
                    if (onValidateValue!.isEmpty) {
                      return 'กรุณาป้อนรายละเอียดสินค้า';
                    } else {
                      return null;
                    }
                  },
                  (onSaveValue) {
                    productDetail = onSaveValue;
                  },
                  keyboardType: TextInputType.multiline,
                  maxLine: null,
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width - 120,
                child: inputFieldWidget(
                  context,
                  Icon(Icons.password_outlined),
                  'รหัสสินค้า',
                  (onValidateValue) {
                    if (onValidateValue!.isEmpty) {
                      return 'กรุณาป้อนรหัสสินค้า';
                    } else {
                      return null;
                    }
                  },
                  (onSaveValue) {
                    productBarcode = onSaveValue;
                  },
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width - 120,
                child: inputFieldWidget(
                  context,
                  Icon(Icons.attach_money_outlined),
                  'ราคาสินค้า',
                  (onValidateValue) {
                    if (onValidateValue!.isEmpty) {
                      return 'กรุณาป้อนราคาสินค้า';
                    } else {
                      return null;
                    }
                  },
                  (onSaveValue) {
                    productPrice = onSaveValue;
                  },
                  keyboardType: TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width - 120,
                child: inputFieldWidget(
                  context,
                  Icon(Icons.store),
                  'ปริมาณสินค้า',
                  (onValidateValue) {
                    if (onValidateValue!.isEmpty) {
                      return 'กรุณาป้อนปริมาณสินค้า';
                    } else {
                      return null;
                    }
                  },
                  (onSaveValue) {
                    productQty = onSaveValue;
                  },
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width - 120,
                child: inputFieldWidget(
                  context,
                  Icon(Icons.image),
                  'รูปภาพสินค้า',
                  (onValidateValue) {
                    if (onValidateValue!.isEmpty) {
                      return 'กรุณาแนบรูปภาพสินค้า';
                    } else {
                      return null;
                    }
                  },
                  (onSaveValue) {
                    productImage = onSaveValue;
                  },
                  keyboardType: TextInputType.url,
                ),
              ),
              SizedBox(height: 10),
              submitButton(
                'บันทึกสินค้า',
                addProduct,
                color: Colors.teal,
                textColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
