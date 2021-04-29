// base class for network failures
abstract class HttpFailure implements Exception {}

class NetworkFailure implements HttpFailure {}

class ServerFailure extends HttpFailure {}

class AuthorizationFailure extends HttpFailure {}

class NotFoundFailure extends HttpFailure {}

class UnknownFailure extends HttpFailure {}

class OtherFailure extends HttpFailure {
  OtherFailureType type;

  OtherFailure(this.type);
}

abstract class OtherFailureType {}

// TODO add custom failures here

class WrongCredentials extends OtherFailureType {}
