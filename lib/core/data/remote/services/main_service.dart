import 'package:chopper/chopper.dart';

// This is necessary for the generator to work.
part "main_service.chopper.dart";

@ChopperApi(baseUrl: "/api")
abstract class MainService extends ChopperService {
  @Get(path: "/products/")
  Future<Response> productPage(@Query("page") int page);

  static MainService create() => _$MainService();
}
