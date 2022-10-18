// ignore_for_file: file_names

import 'dart:convert';

List<ProductsModel> productsModelFromJson(String str) =>
    List<ProductsModel>.from(
        json.decode(str).map((x) => ProductsModel.fromJson(x)));

String productsModelToJson(ProductsModel data) =>
    json.encode(data.toJson());

class ProductsModel {
  ProductsModel({
    this.id,
    required this.productDetail,
    required this.productName,
    required this.productBarcode,
    required this.productQty,
    required this.productPrice,
    this.productDate,
    required this.productImage,
    this.productCategory,
    this.productStatus,
  });

  String? id;
  String productDetail;
  String productName;
  String productBarcode;
  String productQty;
  String productPrice;
  DateTime? productDate;
  String productImage;
  String? productCategory;
  String? productStatus;

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
        id: json["id"],
        productDetail: json["product_detail"],
        productName: json["product_name"],
        productBarcode: json["product_barcode"],
        productQty: json["product_qty"],
        productPrice: json["product_price"],
        productDate: json["product_date"] == null
            ? null
            : DateTime.parse(json["product_date"]),
        productImage: json["product_image"],
        productCategory: json["product_category"],
        productStatus: json["product_status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_detail": productDetail,
        "product_name": productName,
        "product_barcode": productBarcode,
        "product_qty": productQty,
        "product_price": productPrice,
        "product_date": productDate == null
            ? null
            : "${productDate!.year.toString().padLeft(4, '0')}-${productDate!.month.toString().padLeft(2, '0')}-${productDate!.day.toString().padLeft(2, '0')}",
        "product_image": productImage,
        "product_category": productCategory,
        "product_status": productStatus,
      };
}
