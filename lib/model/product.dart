class Product {
  late double price;
  late String name;
  late int quantity;

  Product(this.name, {this.quantity = 0, this.price = 0.0});

  Product.fromMap(Map<Object?, Object?> map) {
    price = map['price'] as double;
    name = map['name'] as String;
    quantity = map['quantity'] as int;
  }

  double totalAmout() => price * quantity;

  Product clone() => Product(name, price: price);

  int increment(int quantity) {
    this.quantity += quantity;
    return this.quantity;
  }

  Map<String, dynamic> toMap() {
    return {'name': name, 'price': price, 'quantity': quantity};
  }
}
