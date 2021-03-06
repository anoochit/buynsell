import 'dart:developer';

import 'package:hive/hive.dart';
import 'package:raccount/models/businessinfo.dart';
import 'package:raccount/models/contact.dart';
import 'package:raccount/models/product.dart';

class RaccService {
  void saveBusinessInfo(Businessinfo businessinfo) async {
    if (Hive.isAdapterRegistered(BusinessinfoAdapter().typeId) == false) {
      Hive.registerAdapter(BusinessinfoAdapter());
    }

    Box<Businessinfo> box = await Hive.openBox<Businessinfo>('business_info');

    box.put('0', businessinfo);
  }

  Future<Iterable<Businessinfo>> getBusinessInfo() async {
    if (Hive.isAdapterRegistered(BusinessinfoAdapter().typeId) == false) {
      Hive.registerAdapter(BusinessinfoAdapter());
    }

    Box<Businessinfo> box = await Hive.openBox<Businessinfo>('business_info');

    if (box.length == 0) {
      log('-> no data add sample data');
      box.put(
        '0',
        Businessinfo(
          id: '0',
          company: 'Sample Company',
          address1: '1600 Amphitheatre Parkway',
          address2: 'Mountain View, CA 94043',
          phone: '1-877-355-5787',
          email: 'info@sample.co',
          taxid: '123456789',
        ),
      );
      return box.values;
    } else {
      log('-> has data key 0 = ' + box.get('0').company);
      return box.values;
    }
  }

  Future<Iterable<Contact>> getContacts() async {
    if (Hive.isAdapterRegistered(ContactAdapter().typeId) == false) {
      Hive.registerAdapter(ContactAdapter());
    }

    Box<Contact> box = await Hive.openBox<Contact>('contact');

    return box.values;
  }

  Future<void> saveContact(Contact contact) async {
    if (Hive.isAdapterRegistered(ContactAdapter().typeId) == false) {
      Hive.registerAdapter(ContactAdapter());
    }

    Box<Contact> box = await Hive.openBox<Contact>('contact');
    var id = DateTime.now().microsecond.toString();

    Contact p = Contact(
        id: id,
        name: contact.name,
        position: contact.position,
        company: contact.company,
        address1: contact.address1,
        address2: contact.address2,
        phone: contact.phone,
        email: contact.email);

    box.put(id, p);

    log(box.length.toString());
  }

  Future<void> updateContact(Contact contact) async {
    if (Hive.isAdapterRegistered(ContactAdapter().typeId) == false) {
      Hive.registerAdapter(ContactAdapter());
    }

    Box<Contact> box = await Hive.openBox<Contact>('contact');

    Contact p = Contact(
        id: contact.id,
        name: contact.name,
        position: contact.position,
        company: contact.company,
        address1: contact.address1,
        address2: contact.address2,
        phone: contact.phone,
        email: contact.email);

    box.put(contact.id, p);

    log(box.length.toString());
  }

  Future<void> deteteContact({String id}) async {
    if (Hive.isAdapterRegistered(ContactAdapter().typeId) == false) {
      Hive.registerAdapter(ContactAdapter());
    }

    Box<Contact> box = await Hive.openBox<Contact>('contact');

    box.delete(id);
  }

  Future<Iterable<Product>> getProducts() async {
    if (Hive.isAdapterRegistered(ProductAdapter().typeId) == false) {
      Hive.registerAdapter(ProductAdapter());
    }

    Box<Product> box = await Hive.openBox<Product>('product');

    return box.values;
  }

  Future<void> saveProduct(Product product) async {
    if (Hive.isAdapterRegistered(ProductAdapter().typeId) == false) {
      Hive.registerAdapter(ProductAdapter());
    }

    Box<Product> box = await Hive.openBox<Product>('product');
    var id = DateTime.now().microsecond.toString();

    Product p = Product(
        id: id,
        name: product.name,
        description: product.description,
        unit: product.unit,
        price: product.price,
        type: product.type);

    box.put(id, p);

    log(box.length.toString());
  }

  Future<void> deteteProduct({String id}) async {
    if (Hive.isAdapterRegistered(ProductAdapter().typeId) == false) {
      Hive.registerAdapter(ProductAdapter());
    }

    Box<Product> box = await Hive.openBox<Product>('product');

    box.delete(id);
  }

  Future<void> updateProduct(Product product) async {
    if (Hive.isAdapterRegistered(ProductAdapter().typeId) == false) {
      Hive.registerAdapter(ProductAdapter());
    }

    Box<Product> box = await Hive.openBox<Product>('product');

    Product p = Product(
        id: product.id,
        name: product.name,
        description: product.description,
        unit: product.unit,
        price: product.price,
        type: product.type);

    box.put(product.id, p);

    log(box.length.toString());
  }
}
