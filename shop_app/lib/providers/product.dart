import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  final String? id;
  final String? title;
  final double? price;
  final String? description;
  final String? imageUrl;
  bool isFavorite;

  Product({
    @required this.id,
    @required this.description,
    @required this.imageUrl,
    @required this.price,
    @required this.title,
    this.isFavorite = false,
  });

  void toggleFavoriteStatus() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
