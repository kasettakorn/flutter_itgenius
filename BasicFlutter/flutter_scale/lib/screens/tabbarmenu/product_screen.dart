// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_scale/models/ProductsModel.dart';
import 'package:flutter_scale/screens/tabbarmenu/product_item_list.dart';
import 'package:flutter_scale/services/rest_api.dart';
import 'package:flutter_scale/themes/colors.dart';

var refreshKey = GlobalKey<RefreshIndicatorState>();
class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        key: refreshKey,
        onRefresh: () async {
          setState(() {});
        },
        child: FutureBuilder(
          future: CallAPI().getAllProducts(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text('มีข้อผิดพลาดในการดึงข้อมูล'),
              );
            } else if (snapshot.connectionState == ConnectionState.done) {
              List<ProductsModel> products = snapshot.data;
              return listViewProduct(products);
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add_product');
        },
        backgroundColor: accent,
        splashColor: primaryDark,
        child: Icon(Icons.add, color: icons),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
