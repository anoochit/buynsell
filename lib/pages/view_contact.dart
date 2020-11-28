import 'package:flutter/material.dart';
import 'package:raccount/models/contact.dart';
import 'package:raccount/styles/style.dart';

class ViewContactPage extends StatefulWidget {
  Contact contact;

  ViewContactPage({Key key, this.contact}) : super(key: key);

  @override
  _ViewContactPageState createState() => _ViewContactPageState(this.contact);
}

class _ViewContactPageState extends State<ViewContactPage> {
  Contact contact;

  _ViewContactPageState(this.contact);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "View Contact",
          style: kTextAppBarTitle,
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: kAppBarBackground,
        iconTheme: kAppBarIconTheme,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
          child: Flex(
            crossAxisAlignment: CrossAxisAlignment.start,
            direction: Axis.vertical,
            children: [
              Text(
                contact.name,
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
                  contact.position,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              Text(contact.company),
              SizedBox(
                height: 16.0,
              ),
              Text(contact.address1),
              SizedBox(
                height: 16.0,
              ),
              Text(contact.address2),
              SizedBox(
                height: 16.0,
              ),
              Text(contact.phone),
              SizedBox(
                height: 16.0,
              ),
              Text(contact.email),
            ],
          ),
        ),
      ),
    );
  }
}
