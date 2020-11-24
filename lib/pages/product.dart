import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:raccount/models/product.dart';
import 'package:raccount/pages/add_product.dart';
import 'package:raccount/pages/edit_product.dart';
import 'package:raccount/pages/view_product.dart';
import 'package:raccount/service/database.dart';
import 'package:raccount/styles/style.dart';

class ProductPage extends StatefulWidget {
  ProductPage({Key key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  RaccService racc = RaccService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Product",
          style: kTextAppBarTitle,
        ),
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: kAppBarBackground,
        iconTheme: kAppBarIconTheme,
        actions: [
          IconButton(
            icon: Icon(Icons.add_circle),
            onPressed: () async {
              // add product
              final result = await Navigator.push(
                context,
                MaterialPageRoute(builder: (BuildContext context) {
                  return AddProductPage();
                }),
              );
              if (result.toString() != null) {
                setState(() {});
              }
            },
          ),
        ],
      ),
      body: Container(
        child: FutureBuilder(
          future: racc.getProducts(),
          builder: (BuildContext context,
              AsyncSnapshot<Iterable<Product>> snapshot) {
            if (snapshot.hasData) {
              var data = snapshot.data.toList();

              if (data.length > 0) {
                return Container(
                  child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int index) {
                      final priceFormat = new NumberFormat("#,##0.00", "en_US");

                      return Slidable(
                        actionPane: SlidableDrawerActionPane(),
                        actionExtentRatio: 0.25,
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Theme.of(context).primaryColor,
                            foregroundColor: Colors.white,
                            child: Text(
                              data[index].name.substring(0, 1).toUpperCase(),
                            ),
                          ),
                          title: Text(
                            data[index].name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            data[index].description,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          trailing: Text(priceFormat.format(data[index].price)),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return ViewProductPage(product: data[index]);
                                },
                              ),
                            );
                          },
                        ),
                        secondaryActions: <Widget>[
                          IconSlideAction(
                            caption: 'Delete',
                            color: Colors.red,
                            icon: Icons.archive,
                            onTap: () async {
                              Fluttertoast.showToast(msg: 'Deleted');
                              log('item id : ' + data[index].id.toString());
                              racc.deteteProduct(id: data[index].id.toString());
                              setState(() {});
                            },
                          ),
                          IconSlideAction(
                            caption: 'Edit',
                            color: Colors.green,
                            icon: Icons.edit,
                            onTap: () async {
                              final result = await Navigator.push(context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) {
                                return EditProductPage(product: data[index]);
                              }));
                              if (result.toString() != null) {
                                setState(() {});
                              }
                            },
                          ),
                        ],
                      );
                    },
                  ),
                );
              } else {
                return Center(
                  child: Flex(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    direction: Axis.vertical,
                    children: [
                      Text("No data!"),
                    ],
                  ),
                );
              }
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
