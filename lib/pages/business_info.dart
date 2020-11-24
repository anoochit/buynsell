import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:raccount/models/businessinfo.dart';
import 'package:raccount/service/database.dart';
import 'package:raccount/styles/style.dart';

class BusinessInfoPage extends StatefulWidget {
  BusinessInfoPage({Key key}) : super(key: key);

  @override
  _BusinessInfoPageState createState() => _BusinessInfoPageState();
}

class _BusinessInfoPageState extends State<BusinessInfoPage> {
  var formKey = GlobalKey<FormState>();
  var rAcc = RaccService();

  var textCompanyController = TextEditingController();
  var textAddress1Controller = TextEditingController();
  var textAddress2Controller = TextEditingController();
  var textPhoneController = TextEditingController();
  var textEmailController = TextEditingController();
  var textTaxIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Business Info",
          style: kTextAppBarTitle,
        ),
        elevation: 0.0,
        backgroundColor: kAppBarBackground,
        iconTheme: kAppBarIconTheme,
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.save_alt),
            onPressed: () {
              if (formKey.currentState.validate()) {
                // save business info to key 0
                Businessinfo businessinfo = Businessinfo(
                  id: '0',
                  company: textCompanyController.text,
                  address1: textAddress1Controller.text,
                  address2: textAddress2Controller.text,
                  phone: textPhoneController.text,
                  email: textEmailController.text,
                  taxid: textTaxIdController.text,
                );
                rAcc.saveBusinessInfo(businessinfo);
                Fluttertoast.showToast(msg: "Saved");
                setState(() {});
                Navigator.pop(context);
              }
            },
          ),
        ],
      ),
      body: Container(
        child: FutureBuilder(
          future: rAcc.getBusinessInfo(),
          builder: (BuildContext context,
              AsyncSnapshot<Iterable<Businessinfo>> snapshot) {
            if (snapshot.hasData) {
              var data = snapshot.data;

              // load data
              textCompanyController.text = data.first.company;
              textAddress1Controller.text = data.first.address1;
              textAddress2Controller.text = data.first.address2;
              textPhoneController.text = data.first.phone;
              textEmailController.text = data.first.email;
              textTaxIdController.text = data.first.taxid;

              return Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 8.0),
                  child: Flex(
                    direction: Axis.vertical,
                    children: [
                      TextFormField(
                        controller: textCompanyController,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.business),
                            labelText: 'Company'),
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
                            labelText: 'Phone number'),
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
                            prefixIcon: Icon(Icons.email), labelText: 'Email'),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Email is empty';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: textTaxIdController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            labelText: 'Tax ID'),
                      ),
                    ],
                  ),
                ),
              );
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
