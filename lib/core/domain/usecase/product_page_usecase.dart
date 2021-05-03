import 'package:clean_arch2/core/core.dart';
import 'package:clean_arch2/core/domain/models/product.dart';
import 'package:clean_arch2/core/domain/repo/main_repo.dart';

class ProductPageUseCase extends ParamUseCase<int, ProductPage> {
  MainRepo _repo;

  ProductPageUseCase(this._repo);

  @override
  Future<ProductPage> build(int param) {
    return _repo.fetchProductPage(param);
  }
}

class ProductPage {
  int count;
  int? next;
  int? previous;

  List<Product> products;

  ProductPage(this.count, this.next, this.previous, this.products);
}
