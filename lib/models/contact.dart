import 'package:hive/hive.dart';

part 'contact.g.dart';

@HiveType(typeId: 2)
class Contact extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String position;

  @HiveField(3)
  final String company;

  @HiveField(4)
  final String address1;

  @HiveField(5)
  final String address2;

  @HiveField(6)
  final String phone;

  @HiveField(7)
  final String email;

  Contact({
    this.id,
    this.name,
    this.position,
    this.company,
    this.address1,
    this.address2,
    this.phone,
    this.email,
  });
}
