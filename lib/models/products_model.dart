

class ProductsModel {
  final String? name;
  final double? price;
  final int? id;
  final String? image;
  final String? description;
  final String? category;
  final Rating? rating;

  ProductsModel(
      {this.name,
      this.id,
      this.image,
      this.price,
      this.description,
      this.category,
      this.rating});
  factory ProductsModel.fromjson(Map<String, dynamic> json) {
    return ProductsModel(
      name: json['title'],
      id: json['id'],
      image: json['image'],
      price: json['price'].toDouble(),
      description: json['description'],
      category: json['category'],
      rating: Rating.fromJson(json['rating']),
    );
  }
}

class Rating {
  final double? rate;
  final int? count;

  Rating({
    this.rate,
    this.count,
  });

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        rate: json["rate"].toDouble(),
        count: json["count"],
      );
}
