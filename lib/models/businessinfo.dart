import 'package:hive/hive.dart';

part 'businessinfo.g.dart';

@HiveType(typeId: 1)
class Businessinfo {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String company;

  @HiveField(2)
  final String address1;

  @HiveField(3)
  final String address2;

  @HiveField(4)
  final String phone;

  @HiveField(5)
  final String email;

  @HiveField(6)
  final String taxid;

  Businessinfo(
      {this.id,
      this.company,
      this.address1,
      this.address2,
      this.phone,
      this.email,
      this.taxid});
}
