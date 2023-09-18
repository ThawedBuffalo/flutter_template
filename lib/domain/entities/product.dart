import 'package:equatable/equatable.dart';

// entity is the logical model
class Product extends Equatable {
  final int id;
  final String name;
  final String description;
  final bool topSeller;
  final bool topRated;
  final String color;
  final String size;

  const Product(
      {required this.id,
      required this.name,
      required this.description,
      required this.topSeller,
      required this.topRated,
      required this.color,
      required this.size});

  factory Product.fromJson(Map<String, dynamic> jsonData) {
    Map<String, dynamic> jsonUserData = jsonData['data'];

    return Product(
        id: jsonUserData['id'],
        name: jsonUserData['name'],
        description: jsonUserData['description'],
        topSeller: jsonUserData['topSeller'],
        topRated: jsonUserData['topRated'],
        color: jsonUserData['color'],
        size: jsonUserData['size']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'topSeller': topSeller,
      'topRated': topRated,
      'color': color,
      'size': size
    };
  }

  @override
  List<Object?> get props =>
      [id, name, description, topSeller, topRated, color, size];
}
