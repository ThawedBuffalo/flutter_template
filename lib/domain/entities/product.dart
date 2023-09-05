import 'dart:ffi';

import 'package:equatable/equatable.dart';

// entity is the logical model

class Product extends Equatable {
  final Long id;
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

  factory Placeholder.fromJson(Map<String, dynamic> jsonData) {
    Map<String, dynamic> jsonUserData = jsonData['placeholder_jsontitle'];

    return Placeholder(
        placeholderId: jsonUserData['placeholderId'],
        placeholderName: jsonUserData['placeholderName'],
        optionalPlaceholder: jsonUserData['optionalPlaceholder']);
  }

  Map<String, dynamic> toJson() {
    return {
      'placeholderId': placeholderId,
      'placeholderName': placeholderName,
      'optionalPlaceholder': optionalPlaceholder
    };
  }

  @override
  List<Object?> get props =>
      [placeholderId, placeholderName, optionalPlaceholder];
}
