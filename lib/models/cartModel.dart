class CartModel {
  int id;
  int userId;
  DateTime date;
  List<Product> products;
  int v;

  CartModel({
    required this.id,
    required this.userId,
    required this.date,
    required this.products,
    required this.v,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
    id: json["id"],
    userId: json["userId"],
    date: DateTime.parse(json["date"]),
    products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    v: json["__v"],
  );


}

class Product {
  int productId;
  int quantity;

  Product({
    required this.productId,
    required this.quantity,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    productId: json["productId"],
    quantity: json["quantity"],
  );

}
