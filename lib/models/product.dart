import 'package:hive/hive.dart';

part 'product.g.dart';

@HiveType(typeId: 3)
class Product {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String description;

  @HiveField(3)
  final String unit;

  @HiveField(4)
  final double price;

  @HiveField(5)
  final String type;

  Product(
      {this.id, this.name, this.description, this.unit, this.price, this.type});
}
