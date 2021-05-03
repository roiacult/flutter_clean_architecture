import 'package:chopper/chopper.dart';
import 'package:clean_arch2/core/data/remote/models/remote_product.dart';
import 'package:clean_arch2/core/data/remote/services/main_service.dart';
import 'package:clean_arch2/core/data/utils.dart';

class MainRemote {
  ChopperClient _client;

  MainRemote(this._client);

  Future<RemoteProductPage> fetchProductPage(int page) async {
    final mainService = _client.getService<MainService>();

    // send request and check connectivity
    final response = await sendRequest(mainService.productPage(page));

    final body = handleFailures(response: response, emptyResponse: false)!;
    return RemoteProductPage.fromJson(body);
  }
}
