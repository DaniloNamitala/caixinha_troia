import 'package:caixinha_troia/model/product.dart';

class Cart {
  late List<Product> products;

  Cart() {
    products = List.empty();
  }

  Cart.fromMap(Map<Object?, Object?> map) {
    products = List.empty();
  }

  double total() => products.fold(
      0.0, (previousValue, element) => previousValue + element.totalAmout());

  void insert(Product product, int quantity) {
    if (products.any((e) => e.name == product.name)) {
      var p = products.firstWhere((e) => e.name == product.name);
      p.increment(quantity);
    } else {
      var p = product.clone();
      p.increment(quantity);
      products.add(p);
    }
    product.increment(-quantity);
  }

  Map<String, dynamic> toMap() {
    return {'products': 'null'};
  }
}
