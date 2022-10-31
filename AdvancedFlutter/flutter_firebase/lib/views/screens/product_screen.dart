// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  //อ่านฐานข้อมูลจาก Firestore
  final CollectionReference _products =
      FirebaseFirestore.instance.collection('products');

  //สร้างตัวแปรเก็บ textfield
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  //สร้าง function เพิ่มและแก้ไขรายการ
  Future<void> _createOrUpdate([DocumentSnapshot? documentSnapshot]) async {
    String action = 'create';
    if (documentSnapshot != null) {
      action = 'update';
      _nameController.text = documentSnapshot['name'];
      _priceController.text = documentSnapshot['price'].toString();
    }

    // สร้าง popup แบบ Bottom sheet
    await showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(context).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: 'ชื่อสินค้า'),
                ),
                TextField(
                  controller: _priceController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(labelText: 'ราคาสินค้า'),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        final String? name = _nameController.text;
                        final double? price =
                            double.tryParse(_priceController.text);

                        if (name != null && price != null) {
                          if (action == 'create') {
                            await _products.add({
                              "name": name,
                              "price": price,
                              "create_at": Timestamp.now(),
                            });
                          } else if (action == 'update') {
                            await _products
                                .doc(documentSnapshot!.id)
                                .update({"name": name, "price": price});
                          }
                        }

                        // Clear ฟอร์มข้อมูลออกจาก textfield
                        _nameController.text = '';
                        _priceController.text = '';

                        // ปิด bottom sheet
                        Navigator.of(context).pop();
                      },
                      child: Text(
                          action == 'create' ? 'เพิ่มสินค้า' : 'แก้ไขสินค้า'),
                    ),
                  ],
                ),
                SizedBox(height: 20),
              ],
            ),
          );
        });
  }

  Future<void> _deleteProduct(String docId) async {
    await _products.doc(docId).delete();
    //แจ้งผลการลบ
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('ลบสินค้าเสร็จสมบูรณ์')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product'),
      ),
      body: Center(
        child: StreamBuilder(
          stream: _products.orderBy('create_at', descending: true).snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            if (streamSnapshot.hasData) {
              return ListView.builder(
                  itemCount: streamSnapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final DocumentSnapshot documentSnapshot =
                        streamSnapshot.data!.docs[index];

                    return Card(
                      margin: EdgeInsets.all(10),
                      child: ListTile(
                          title: Text(documentSnapshot['name']),
                          subtitle: Text('${documentSnapshot['price']} บาท'),
                          leading: Icon(Icons.shopping_cart),
                          trailing: SizedBox(
                            width: 100,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                IconButton(
                                    onPressed: () =>
                                        _createOrUpdate(documentSnapshot),
                                    icon: Icon(
                                      Icons.edit,
                                      color: Colors.orange,
                                    )),
                                IconButton(
                                    onPressed: () =>
                                        _deleteProduct(documentSnapshot.id),
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.red.shade600,
                                    )),
                              ],
                            ),
                          )),
                    );
                  });
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _createOrUpdate,
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
