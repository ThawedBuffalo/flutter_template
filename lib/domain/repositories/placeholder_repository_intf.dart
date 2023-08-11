import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../entities/placeholder.dart';

abstract class PlaceholderRepositoryInterface {
  Future<Either<Failure, Placeholder>> getPlaceholderData(
      String placeholderParam);
}
