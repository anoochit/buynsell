import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:package_info/package_info.dart';
import 'package:raccount/pages/business_info.dart';
import 'package:raccount/pages/contact.dart';
import 'package:raccount/pages/product.dart';

class SettingPage extends StatefulWidget {
  SettingPage({Key key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  List<String> listMenu = [
    'Business Info',
    'Bank Acccount',
    'Contact',
    'Product',
    'Version'
  ];
  List<IconData> listIcon = [
    Icons.business,
    Icons.account_balance,
    Icons.account_box,
    Icons.add_comment,
    Icons.info
  ];

  clickSetting(int index) {
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) {
              return BusinessInfoPage();
            },
          ),
        );
        break;
      case 1:
        Fluttertoast.showToast(msg: 'Not implement yet!');
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) {
              return ContactPage();
            },
          ),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) {
              return ProductPage();
            },
          ),
        );
        break;
      case 4:
        Fluttertoast.showToast(msg: 'Version ' + version);
        break;
      default:
        break;
    }
  }

  String appName = "";
  String packageName = "";
  String version = "";
  String buildNumber = "";

  Future<Map<String, String>> getVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    appName = packageInfo.appName;
    packageName = packageInfo.packageName;
    version = packageInfo.version;
    buildNumber = packageInfo.buildNumber;

    var packageInfoMap = {
      'appName': appName,
      'packageName': packageName,
      'version': version,
      'buildNumber': buildNumber
    };

    return packageInfoMap;
  }

  @override
  void initState() {
    getVersion().then((value) {
      listMenu[4] = 'Version ' + value['version'];
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: listMenu.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Icon(
              listIcon[index],
              color: Theme.of(context).primaryColor,
            ),
            title: Text(listMenu[index]),
            onTap: () {
              clickSetting(index);
            },
          );
        },
      ),
    );
  }
}
