import 'package:equatable/equatable.dart';

// models are the direct mapping from repository/apis
// entities are the logical models

class PlaceholderModel extends Equatable {
  final String? optionalPlaceholder;
  final String requiredPlaceholder;

  const PlaceholderModel(
      {required this.optionalPlaceholder, required this.requiredPlaceholder});

  factory PlaceholderModel.fromJson(Map<String, dynamic> jsonData) {
    Map<String, dynamic> jsonUserData = jsonData['placeholder'];

    return PlaceholderModel(
        optionalPlaceholder: jsonUserData['optionalPlaceholder'],
        requiredPlaceholder: jsonUserData['requiredPlaceholder']);
  }

  Map<String, dynamic> toJson() {
    return {
      'optionalPlaceholder': optionalPlaceholder,
      'requiredPlaceholder': requiredPlaceholder
    };
  }

  @override
  List<Object?> get props => [optionalPlaceholder, requiredPlaceholder];
}
