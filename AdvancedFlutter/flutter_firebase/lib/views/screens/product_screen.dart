// ignore_for_file: prefer_const_constructors

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product'),
      ),
      body: Center(
        child: StreamBuilder(
          stream: _products.snapshots(),
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
                      ),
                    );
                  });
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
