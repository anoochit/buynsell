import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:raccount/models/product.dart';
import 'package:raccount/styles/style.dart';

class ViewProductPage extends StatefulWidget {
  final Product product;
  ViewProductPage({Key key, this.product}) : super(key: key);

  @override
  _ViewProductPageState createState() => _ViewProductPageState(this.product);
}

class _ViewProductPageState extends State<ViewProductPage> {
  _ViewProductPageState(this.product);

  Product product;

  @override
  Widget build(BuildContext context) {
    final priceFormat = new NumberFormat("#,##0.00", "en_US");
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "View Product",
          style: kTextAppBarTitle,
        ),
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: kAppBarBackground,
        iconTheme: kAppBarIconTheme,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 16.0,
        ),
        child: Flex(
          direction: Axis.vertical,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.name,
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 4.0),
              decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(10.0)),
              child: Text(
                product.type,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            Text(
              product.description,
            ),
            SizedBox(
              height: 16.0,
            ),
            Text(
              priceFormat.format(product.price),
              style: TextStyle(
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
