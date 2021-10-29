import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../providers/products_provider.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = 'product-detail';

  @override
  Widget build(BuildContext context) {
    final productId =
        ModalRoute.of(context)!.settings.arguments as String; // is product id!
    final loadedProducts = context.read()<Products>().findById(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProducts.title!),
      ),
      body: Column(
        children: [
          Container(
            child: Image.network(
              loadedProducts.imageUrl!,
              fit: BoxFit.cover,
            ),
            width: double.infinity,
            height: 300,
          ),
          SizedBox(height: 10),
          Text(
            '\$${loadedProducts.price}',
            textAlign: TextAlign.center,
            style:
                TextStyle(color: Theme.of(context).accentColor, fontSize: 20),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            loadedProducts.description!,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
