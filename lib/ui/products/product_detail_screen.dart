import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopcaycanh/models/cart_item.dart';
import 'package:shopcaycanh/models/payment.dart';
import 'package:shopcaycanh/ui/cart/cart_screen.dart';
import 'package:shopcaycanh/ui/products/top_right_badge.dart';

import '../../models/product.dart';
import '../cart/cart_manager.dart';

import '../payment/payment_screen.dart';
import '../payment/payment_manager.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';
  const ProductDetailScreen(
    this.product, {
    super.key,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          SizedBox(
            height: 300,
            width: double.infinity,
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            '${product.price}',
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 10),
          buildShoppingCartIcon(),
          Container(
            width: 200,
            height: 40,
            child: ElevatedButton(
              onPressed: () {
                // context.read<PaymentManager>().addPaymentInProductDetail(
                //     title: product.title,
                //     description: product.description,
                //     price: product.price,
                //     imageUrl: product.imageUrl,
                //     id: product.id);
                print(product.title);
                Navigator.of(context).pushNamed(PaymentScreen.routeName,
                    arguments: Product(
                        title: product.title,
                        description: product.description,
                        price: product.price,
                        imageUrl: product.imageUrl));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: const Text('Đặt hàng',
                  style: TextStyle(
                    color: Colors.white,
                  )),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            width: double.infinity,
            child: Text(
              product.description,
              textAlign: TextAlign.center,
              softWrap: true,
            ),
          )
        ]),
      ),
    );
  }

  Widget buildShoppingCartIcon() {
    return Consumer<CartManager>(
      builder: (context, cartManager, child) {
        return Container(
          child: IconButton(
              onPressed: () {
                final cart = context.read<CartManager>();
                cart.addItem(product);
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(SnackBar(
                    content: const Text('Da them vao gio hang'),
                    duration: const Duration(seconds: 2),
                    action: SnackBarAction(
                      label: 'UNDO',
                      onPressed: () {
                        cart.removeSingleItem(product.id!);
                      },
                    ),
                  ));
              },
              icon: const Icon(Icons.shopping_cart)),
        );
      },
    );
  }
}
