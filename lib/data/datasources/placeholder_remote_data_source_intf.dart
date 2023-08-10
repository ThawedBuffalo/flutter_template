import '../models/placeholder_model.dart';

abstract class PlaceholderRemoteDataSourceInterface {
  Future<PlaceholderModel> getRemotePlaceholderData(String placeholderParam);
}
