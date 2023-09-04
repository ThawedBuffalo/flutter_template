import 'package:equatable/equatable.dart';

// models are the direct mapping from repository/apis
// entities are the logical models

class FormModel extends Equatable {
  final String productName;
  final String productDescription;

  const FormModel(
      {required this.placeholderId,
      required this.placeholderName,
      required this.optionalPlaceholder});

  factory FormModel.fromJson(Map<String, dynamic> jsonData) {
    Map<String, dynamic> jsonUserData = jsonData['placeholder_jsontitle'];

    return FormModel(
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
