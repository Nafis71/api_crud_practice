import '../models/product_model.dart';

abstract class DataRepository {
  Future<List<ProductModel>> getProductData();

  Future<bool> addProduct(ProductModel product);

  Future<bool> updateProduct(ProductModel product);

  List<ProductModel> removeProductData(
      List<ProductModel> productList, int index);

  List<ProductModel> sortProductHighToLow(List<ProductModel> productList);
  List<ProductModel> sortProductLowToHigh(List<ProductModel> productList);

  ProductModel processInputData({
    required String productName,
    required String productCode,
    required String productImage,
    required String productUnitPrice,
    required String productQuantity,
    String? productId,
  });
}
