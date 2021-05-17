import 'package:flutter/material.dart';
import 'package:flutter_redux_dev_tools/flutter_redux_dev_tools.dart';
import 'package:shopping_cart/model/cart_item.dart';
import 'package:shopping_cart/shopping_list.dart';
import 'add_item_dialog.dart';
import 'package:redux/redux.dart';
import 'package:redux_dev_tools/redux_dev_tools.dart';
import 'package:flutter_redux_dev_tools/flutter_redux_dev_tools.dart';

class ShoppingCart extends StatelessWidget {
  final DevToolsStore<List<CartItem>> store;
  const ShoppingCart({Key key, this.store}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping Cart"),
      ),
      body: ShoppingList(),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>_openAddItemDialog(context),
        child: Icon(Icons.add),
      ),
      endDrawer: ReduxDevTools(store),
    );
  }
}

_openAddItemDialog(BuildContext context){
  showDialog(context: context,builder: (context)=>new AddItemDialog() );
}



