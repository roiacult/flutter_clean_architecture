import 'package:clean_arch2/core/data/remote/main_remote.dart';
import 'package:clean_arch2/core/data/remote/models/remote_product.dart';
import 'package:clean_arch2/core/data/utils.dart';
import 'package:clean_arch2/core/domain/repo/main_repo.dart';
import 'package:clean_arch2/core/domain/usecase/product_page_usecase.dart';

class MainRepoImpl implements MainRepo {
  MainRemote _remote;

  MainRepoImpl(this._remote);

  @override
  Future<ProductPage> fetchProductPage(int page) async {
    return (await _remote.fetchProductPage(page)).toPage();
  }
}

extension productPageExtention on RemoteProductPage {
  ProductPage toPage() {
    return ProductPage(count, next?.toPage(), previous?.toPage(),
        results.map((e) => e.toProduct()).toList());
  }
}
