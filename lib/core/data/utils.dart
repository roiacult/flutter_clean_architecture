import 'package:chopper/chopper.dart';
import 'package:clean_arch2/core/domain/failures.dart';

BodyType? handleFailures<BodyType>(
    {required Response response, emptyResponse = false, additionalCheck}) {
  final status = response.statusCode;

  if (status >= 500)
    throw ServerFailure();
  else if (status == 401 || status == 403)
    throw AuthorizationFailure();
  else if (status == 404)
    throw NotFoundFailure();
  else {
    if (response.isSuccessful) {
      if (emptyResponse)
        return response.body;
      else if (!emptyResponse && response.body != null) return response.body;
    }
  }
  if (additionalCheck != null) return additionalCheck(response);
  throw UnknownFailure();
}

Future<Response> sendRequest(Future<Response> future) async {
  try {
    return await future;
  } catch (e) {
    throw NetworkFailure();
  }
}

extension page_extension on String {
  int toPage() {
    return 0;
  }
}
