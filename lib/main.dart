import 'package:flutter/material.dart';
import 'package:shopping_cart/model/cart_item.dart';
import 'package:shopping_cart/shopping_cart.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:shopping_cart/redux/reducers.dart';
import 'package:redux_dev_tools/redux_dev_tools.dart';

void main() {
  final store= new DevToolsStore<List<CartItem>>(cartItemsReducer,initialState: new List());
  runApp(ShoppingApp(store: store));
}

class ShoppingApp extends StatelessWidget {
  final DevToolsStore<List<CartItem>> store;
  const ShoppingApp({Key key, this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        home: ShoppingCart(store: store),
      ),
    );
  }
}
