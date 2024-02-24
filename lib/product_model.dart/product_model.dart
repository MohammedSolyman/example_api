// ignore_for_file: public_member_api_docs, sort_constructors_first
// {
//     "id": 1,
//     "title": "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
//     "price": 109.95,
//     "description": "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
//     "category": "men's clothing",
//     "image": "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
//     "rating": {
//       "rate": 3.9,
//       "count": 120
//     }
//   }
import 'dart:convert';

List<Product> fromJsonToProducts(String json) {
  List<dynamic> maps = jsonDecode(json);
  return maps.map<Product>((e) => Product.fromMap(e)).toList();
}

String fromProductToJson(Product product) {
  Map<String, dynamic> map = product.toMap();
  return jsonEncode(map);
}

class Product {
  int id;
  String title;
  double price;
  String description;
  String category;
  String image;
  Rating rating;
  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
        id: map['id'],
        title: map['title'],
        price: map['price'].toDouble(),
        description: map['description'],
        category: map['category'],
        image: map['image'],
        rating: Rating.fromMap(map["rating"]));
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'category': category,
      'image': image,
      'rating': rating.toMap(),
    };
  }
}

class Rating {
  double rate;
  int count;
  Rating({
    required this.rate,
    required this.count,
  });

  factory Rating.fromMap(Map<String, dynamic> map) {
    return Rating(rate: map['rate'].toDouble(), count: map['count']);
  }

  Map<String, dynamic> toMap() {
    return {'rate': rate, 'count': count};
  }
}

//////////////////////////////////////////////////////////////////
/// quick.io list of products
///
// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);
 
// import 'dart:convert';

// List<Product> productFromJson(String str) =>
//     List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

// String productToJson(List<Product> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class Product {
//   int? id;
//   String? title;
//   double? price;
//   String? description;
//   String? category;
//   String? image;
//   Rating? rating;

//   Product({
//     this.id,
//     this.title,
//     this.price,
//     this.description,
//     this.category,
//     this.image,
//     this.rating,
//   });

//   factory Product.fromJson(Map<String, dynamic> json) => Product(
//         id: json["id"],
//         title: json["title"],
//         price: json["price"]?.toDouble(),
//         description: json["description"],
//         category: json["category"],
//         image: json["image"],
//         rating: json["rating"] == null ? null : Rating.fromJson(json["rating"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "title": title,
//         "price": price,
//         "description": description,
//         "category": category,
//         "image": image,
//         "rating": rating?.toJson(),
//       };
// }

// class Rating {
//   double? rate;
//   int? count;

//   Rating({
//     this.rate,
//     this.count,
//   });

//   factory Rating.fromJson(Map<String, dynamic> json) => Rating(
//         rate: json["rate"]?.toDouble(),
//         count: json["count"],
//       );

//   Map<String, dynamic> toJson() => {
//         "rate": rate,
//         "count": count,
//       };
// }
