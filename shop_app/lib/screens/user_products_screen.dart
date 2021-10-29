import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../screens/edit_products_screen.dart';

import '../widgets/app_drawer.dart';
import '../widgets/user_products_item.dart';
import '../providers/products_provider.dart';

class UserProductsScreen extends StatelessWidget {
  static const routeName = 'user-products';
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Products'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(EditProductsScreen.routeName);
            },
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: productsData.items.length,
          itemBuilder: (ctx, i) => Column(
            children: [
              UserProductsItem(
                  productsData.items[i].id!,
                  productsData.items[i].title!,
                  productsData.items[i].imageUrl!),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
