import 'package:equatable/equatable.dart';

// NOTE: this file would normally live in the clean arch model layer, here just for demo

// models are the direct mapping from repository/apis
// entities are the logical models

class FormModel extends Equatable {
  final String productName;
  final String productDescription;
  final String? optionalPlaceholder;

  const FormModel(
      {required this.productName,
      required this.productDescription,
      required this.optionalPlaceholder});

  factory FormModel.fromJson(Map<String, dynamic> jsonData) {
    Map<String, dynamic> jsonUserData = jsonData['placeholder_jsontitle'];

    return FormModel(
        productName: jsonUserData['placeholderId'],
        productDescription: jsonUserData['placeholderName'],
        optionalPlaceholder: jsonUserData['optionalPlaceholder']);
  }

  Map<String, dynamic> toJson() {
    return {
      'placeholderId': productName,
      'placeholderName': productDescription,
      'optionalPlaceholder': optionalPlaceholder
    };
  }

  @override
  List<Object?> get props =>
      [productName, productDescription, optionalPlaceholder];
}
