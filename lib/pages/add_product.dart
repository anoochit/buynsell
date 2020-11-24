import 'package:flutter/material.dart';
import 'package:raccount/models/product.dart';
import 'package:raccount/service/database.dart';
import 'package:raccount/styles/style.dart';

class AddProductPage extends StatefulWidget {
  AddProductPage({Key key}) : super(key: key);

  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  var textNameController = TextEditingController();
  var textDescriptionController = TextEditingController();
  var textUnitController = TextEditingController();
  var textPriceController = TextEditingController();
  var textTypeController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  var rAcc = RaccService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Product",
          style: kTextAppBarTitle,
        ),
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: kAppBarBackground,
        iconTheme: kAppBarIconTheme,
        actions: [
          IconButton(
            icon: Icon(Icons.save_alt),
            onPressed: () {
              if (formKey.currentState.validate()) {
                rAcc.saveProduct(
                  Product(
                      id: null,
                      name: textNameController.text,
                      description: textDescriptionController.text,
                      price: double.parse(textPriceController.text),
                      unit: textUnitController.text,
                      type: "service"),
                );
                Navigator.pop(context, 'added');
              }
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
        child: Form(
          key: formKey,
          child: Flex(
            direction: Axis.vertical,
            children: [
              TextFormField(
                controller: textNameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.book),
                  labelText: 'Name',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Name is empty';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 8.0,
              ),
              TextFormField(
                controller: textDescriptionController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.info),
                  labelText: 'Description',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Description is empty';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 8.0,
              ),
              TextFormField(
                controller: textUnitController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.local_offer),
                  labelText: 'Unit name',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Unit name is empty';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 8.0,
              ),
              TextFormField(
                controller: textPriceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.monetization_on),
                  labelText: 'Price',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Price is empty';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 8.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
