import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:raccount/models/contact.dart';
import 'package:raccount/pages/add_contact.dart';
import 'package:raccount/pages/edit_contact.dart';
import 'package:raccount/pages/view_contact.dart';
import 'package:raccount/service/database.dart';
import 'package:raccount/styles/style.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatefulWidget {
  ContactPage({Key key}) : super(key: key);

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  RaccService racc = RaccService();

  launchCall(String number) async {
    var tel = 'tel:' + number;
    if (await canLaunch(tel)) {
      await launch(tel);
    } else {
      throw 'Could not launch $tel';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Contact",
          style: kTextAppBarTitle,
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: kAppBarBackground,
        iconTheme: kAppBarIconTheme,
        actions: [
          IconButton(
            icon: Icon(Icons.add_circle),
            onPressed: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return AddContactPage();
                  },
                ),
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
          future: racc.getContacts(),
          builder: (BuildContext context,
              AsyncSnapshot<Iterable<Contact>> snapshot) {
            if (snapshot.hasData) {
              var data = snapshot.data.toList();

              if (data.length > 0) {
                return Container(
                  child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Slidable(
                        actionPane: SlidableDrawerActionPane(),
                        actionExtentRatio: 0.25,
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Theme.of(context).primaryColor,
                            child: Text(data[index].name.substring(0, 1)),
                            foregroundColor: Colors.white,
                          ),
                          title: Text(
                            data[index].name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(data[index].position),
                          trailing: IconButton(
                              icon: Icon(Icons.call),
                              onPressed: () {
                                launchCall(data[index].phone);
                              }),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (BuildContext context) {
                              return ViewContactPage(contact: data[index]);
                            }));
                          },
                        ),
                        secondaryActions: <Widget>[
                          IconSlideAction(
                            caption: 'Delete',
                            color: Colors.red,
                            icon: Icons.archive,
                            onTap: () {
                              Fluttertoast.showToast(msg: 'Deleted');
                              racc.deteteContact(id: data[index].id);
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
                                return EditContactPage(contact: data[index]);
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
