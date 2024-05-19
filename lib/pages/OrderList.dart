import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:minmalecommerce/models/product_model.dart';
import 'package:minmalecommerce/models/shop_model.dart';
import 'package:minmalecommerce/pages/shop_page.dart';
import 'package:provider/provider.dart';

class OrderListScreen extends StatefulWidget {
  final String imagePath;
  final String itemName;
  final double itemPrice;

  const OrderListScreen({
    Key? key,
    required this.imagePath,
    required this.itemName,
    required this.itemPrice,
  }) : super(key: key);

  @override
  _OrderListScreenState createState() => _OrderListScreenState();
}

class _OrderListScreenState extends State<OrderListScreen> {
  final ImagePicker _picker = ImagePicker();
  XFile? _pickedImage;

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _pickedImage = pickedFile;
    });
  }

  void uploadTransaction(BuildContext context) {
    FirebaseFirestore.instance.collection('transaction_list').add({
      'itemName': widget.itemName,
      'itemPrice': widget.itemPrice,
      'timestamp': Timestamp.now(),
    }).then((value) {
      print('Transaction uploaded successfully');
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Success'),
          content: Text('Transaction uploaded successfully'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => ShopPage()),
                );
                // Clear cart after successful transaction
                context.read<Shop>().clearCart();
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }).catchError((error) {
      print('Error uploading transaction: $error');
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Error uploading transaction'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order List'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Icon(Icons.email, size: 24),
                  SizedBox(width: 8),
                  Text('user@example.com', style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
            Divider(color: Colors.black),
            ListTile(
              title: Row(
                children: [
                  GestureDetector(
                    onTap: _pickImage,
                    child: _pickedImage == null
                        ? Image.network(
                            widget.imagePath,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          )
                        : Image.file(
                            File(_pickedImage!.path),
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                  ),
                  SizedBox(width: 16),
                  Text(widget.itemName, style: TextStyle(fontSize: 18)),
                  Spacer(),
                  Text('\$${widget.itemPrice.toStringAsFixed(2)}',
                      style: TextStyle(fontSize: 18)),
                ],
              ),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                uploadTransaction(context);
              },
              child: Text('Check Out Now'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.black,
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
