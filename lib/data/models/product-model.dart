import 'package:equatable/equatable.dart';

// NOTE: this file would normally live in the clean arch model layer, here just for demo

// models are the direct mapping from repository/apis
// entities are the logical models

class ProductModel extends Equatable {
  final int id;
  final String name;
  final String description;
  final bool topSeller;
  final bool topRated;
  final String color;
  final String size;

  const ProductModel(
      {required this.id,
      required this.name,
      required this.description,
      required this.topSeller,
      required this.topRated,
      required this.color,
      required this.size});

  factory ProductModel.fromJson(Map<String, dynamic> jsonData) {
    Map<String, dynamic> jsonUserData = jsonData['data'];

    return ProductModel(
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
