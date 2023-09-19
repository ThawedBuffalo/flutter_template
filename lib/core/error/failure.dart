import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

class DataFailure extends Failure {
  final String errorMessage;

  DataFailure({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
