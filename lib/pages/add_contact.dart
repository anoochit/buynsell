import 'package:flutter/material.dart';
import 'package:raccount/models/contact.dart';
import 'package:raccount/service/database.dart';
import 'package:raccount/styles/style.dart';

class AddContactPage extends StatefulWidget {
  AddContactPage({Key key}) : super(key: key);

  @override
  _AddContactPageState createState() => _AddContactPageState();
}

class _AddContactPageState extends State<AddContactPage> {
  var formKey = GlobalKey<FormState>();
  var rAcc = RaccService();

  var textNameController = TextEditingController();
  var textPositionController = TextEditingController();
  var textCompanyController = TextEditingController();
  var textAddress1Controller = TextEditingController();
  var textAddress2Controller = TextEditingController();
  var textPhoneController = TextEditingController();
  var textEmailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Add Contact",
            style: kTextAppBarTitle,
          ),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: kAppBarBackground,
          iconTheme: kAppBarIconTheme,
          actions: [
            IconButton(
              icon: Icon(Icons.save_alt),
              onPressed: () {
                if (formKey.currentState.validate()) {
                  rAcc.saveContact(
                    Contact(
                        id: null,
                        name: textNameController.text,
                        position: textPositionController.text,
                        company: textCompanyController.text,
                        address1: textAddress1Controller.text,
                        address2: textAddress2Controller.text,
                        phone: textPhoneController.text,
                        email: textEmailController.text),
                  );
                  Navigator.pop(context, 'added');
                }
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Form(
              key: formKey,
              child: Flex(
                direction: Axis.vertical,
                children: [
                  TextFormField(
                    controller: textNameController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
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
                    controller: textPositionController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.local_police),
                      labelText: 'Position',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Position is empty';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  TextFormField(
                    controller: textCompanyController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.business),
                      labelText: 'Company',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Company is empty';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  TextFormField(
                    controller: textAddress1Controller,
                    keyboardType: TextInputType.streetAddress,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.location_pin),
                        labelText: 'Address 1'),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Address is empty';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  TextFormField(
                    controller: textAddress2Controller,
                    keyboardType: TextInputType.streetAddress,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.location_pin),
                        labelText: 'Address 2'),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Address is empty';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  TextFormField(
                    controller: textPhoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.phone),
                      labelText: 'Phone number',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Phone is empty';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  TextFormField(
                    controller: textEmailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      labelText: 'Email',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Email is empty';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
