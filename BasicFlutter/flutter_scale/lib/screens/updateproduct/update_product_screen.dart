// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_scale/components/custom_widgets.dart';
import 'package:flutter_scale/models/ProductsModel.dart';
import 'package:flutter_scale/services/rest_api.dart';
import 'package:flutter_scale/utils/utility.dart';

class UpdateProductScreen extends StatefulWidget {
  const UpdateProductScreen({super.key});

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  final formKey = GlobalKey<FormState>();

  String? productName,
      productDetail,
      productBarcode,
      productPrice,
      productQty,
      productImage;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    void editProduct() async {
      if (formKey.currentState!.validate()) {
        formKey.currentState!.save();

        if (await Utility.getInstance()!.checkNetworkConnection() == '') {
          Utility.getInstance()!.showAlertDialog(
              context, 'เกิดข้อผิดพลาด', 'ไม่พบการเชื่อมต่อเครือข่าย');
        } else {
          ProductsModel productsModel = ProductsModel(
            id: args.id,
            productDetail: productDetail.toString(),
            productName: productName.toString(),
            productBarcode: productBarcode.toString(),
            productQty: productQty.toString(),
            productPrice: productPrice.toString(),
            productImage: productImage.toString(),
          );

          var response = await CallAPI().updateProduct(productsModel);

          if (response) {
            Navigator.pop(context, true);
          } else {
            Utility.getInstance()!.showAlertDialog(context, 'เกิดข้อผิดพลาด',
                'ไม่สามารถแก้ไขสินค้าได้ กรุณาลองอีกครั้ง');
          }
        }
      } else {
        Utility.getInstance()!.showAlertDialog(
            context, 'เกิดข้อผิดพลาด', 'กรุณากรอกข้อมูลให้ครบถ้วน');
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('แก้ไขสินค้า'),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width - 120,
                child: inputFieldWidget(
                  context,
                  Icon(Icons.shopping_cart),
                  'ชื่อสินค้า',
                  (onValidateValue) {
                    if (onValidateValue!.isEmpty) {
                      return 'กรุณาป้อนชื่อสินค้า';
                    } else {
                      return null;
                    }
                  },
                  (onSaveValue) {
                    productName = onSaveValue;
                  },
                  initialValue: args.productName,
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width - 120,
                child: inputFieldWidget(
                    context, Icon(Icons.list_alt_outlined), 'รายละเอียดสินค้า',
                    (onValidateValue) {
                  if (onValidateValue!.isEmpty) {
                    return 'กรุณาป้อนรายละเอียดสินค้า';
                  } else {
                    return null;
                  }
                }, (onSaveValue) {
                  productDetail = onSaveValue;
                },
                    keyboardType: TextInputType.multiline,
                    maxLine: null,
                    initialValue: args.productDetail),
              ),
              SizedBox(height: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width - 120,
                child: inputFieldWidget(
                    context, Icon(Icons.password_outlined), 'รหัสสินค้า',
                    (onValidateValue) {
                  if (onValidateValue!.isEmpty) {
                    return 'กรุณาป้อนรหัสสินค้า';
                  } else {
                    return null;
                  }
                }, (onSaveValue) {
                  productBarcode = onSaveValue;
                },
                    keyboardType: TextInputType.number,
                    initialValue: args.productBarcode),
              ),
              SizedBox(height: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width - 120,
                child: inputFieldWidget(
                    context, Icon(Icons.attach_money_outlined), 'ราคาสินค้า',
                    (onValidateValue) {
                  if (onValidateValue!.isEmpty) {
                    return 'กรุณาป้อนราคาสินค้า';
                  } else {
                    return null;
                  }
                }, (onSaveValue) {
                  productPrice = onSaveValue;
                },
                    keyboardType: TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    initialValue: args.productPrice),
              ),
              SizedBox(height: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width - 120,
                child:
                    inputFieldWidget(context, Icon(Icons.store), 'ปริมาณสินค้า',
                        (onValidateValue) {
                  if (onValidateValue!.isEmpty) {
                    return 'กรุณาป้อนปริมาณสินค้า';
                  } else {
                    return null;
                  }
                }, (onSaveValue) {
                  productQty = onSaveValue;
                },
                        keyboardType: TextInputType.number,
                        initialValue: args.productQty),
              ),
              SizedBox(height: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width - 120,
                child:
                    inputFieldWidget(context, Icon(Icons.image), 'รูปภาพสินค้า',
                        (onValidateValue) {
                  if (onValidateValue!.isEmpty) {
                    return 'กรุณาแนบรูปภาพสินค้า';
                  } else {
                    return null;
                  }
                }, (onSaveValue) {
                  productImage = onSaveValue;
                },
                        keyboardType: TextInputType.url,
                        initialValue: args.productImage),
              ),
              SizedBox(height: 10),
              submitButton(
                'อัพเดทสินค้า',
                editProduct,
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

class ScreenArguments {
  final String id,
      productName,
      productDetail,
      productBarcode,
      productPrice,
      productImage,
      productQty;

  ScreenArguments(
      this.id,
      this.productName,
      this.productDetail,
      this.productBarcode,
      this.productPrice,
      this.productImage,
      this.productQty);
}
