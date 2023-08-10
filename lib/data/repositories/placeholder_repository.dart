// app specific imports
import '../../domain/repositories/placeholder_repository_intf.dart';

const String SERVER_FAILURE_MSG =
    'Authentication server failure, please try again...';

class PlaceholderRepository implements PlaceholderRepositoryInterface {
  final PlaceholderRemoteDataSourceInterface placeholderDataSource;

  PlaceholderRepository({required this.placeholderDataSource});

  @override
  Future<Either<Failure, User>> authenticateUser(
      String user, String password) async {
    var connectionResult = await networkInfo.isConnected();
    if (connectionResult == true) {
      try {
        final result = await remoteDataSource.getRemoteUserData(user, password);
        final remoteUser = mapUserModelToUserEntity(result);

        // TODO- store user
        this.setLocalUser(remoteUser);
        return Right(remoteUser);
      } on ServerException {
        return Left(ServerFailure(errorMessage: SERVER_FAILURE_MSG));
      } on InvalidUserPasswordException {
        return Left(InvalidCredentialsFailure(
            errorMessage: INVALID_CREDENTIALS_FAILURE_MSG));
      }
    } else {
      return Left(NetworkFailure(errorMessage: NETWORK_FAILURE));
    }
  }

  User mapUserModelToUserEntity(UserModel userModelInput) {
    // copy the User model to the User entity
    // TODO- this is a kludge until I figure out how to map directly and set the initial date
    final initDateTime = new DateTime.now();
    return new User(
        isVerified: userModelInput.isVerified,
        firstName: userModelInput.firstName,
        userId: userModelInput.userId,
        email: userModelInput.email,
        isActive: userModelInput.isActive,
        initialLogInDateTime: initDateTime);
  }

  @override
  Either<Failure, User> getLocalUser() {
    try {
      final localUser = localDataSource.getUserData();
      return Right(localUser);
    } on LocalStoreException {
      return Left(LocalStorageFailure(errorMessage: USER_CACHE_FAILURE));
    }
  }

  @override
  Future<Either<Failure, void>> setLocalUser(User userToStore) async {
    try {
      return Right(await localDataSource.setUserData(userToStore));
    } on LocalStoreException {
      return Left(LocalStorageFailure(errorMessage: USER_CACHE_FAILURE));
    }
  }
}
