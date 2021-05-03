import 'package:clean_arch2/core/domain/usecase/product_page_usecase.dart';

abstract class MainRepo {
  Future<ProductPage> fetchProductPage(int page);
}
