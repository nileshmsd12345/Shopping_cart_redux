import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:shopping_cart/model/cart_item.dart';
import 'package:shopping_cart/redux/actions.dart';

class ShoppingItem extends StatefulWidget {
  final CartItem item;
  const ShoppingItem({Key key, this.item}) : super(key: key);

  @override
  _ShoppingItemState createState() => _ShoppingItemState();
}

class _ShoppingItemState extends State<ShoppingItem> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<List<CartItem>,onItemDeleted>(
      converter: (store) =>
          (itemName) => store.dispatch(DeleteItemAction(widget.item)),
      builder: (context,callback)=>Dismissible(
        onDismissed: (_){
          setState(() {
           callback(widget.item.name);
          });
        } ,
        key: Key(widget.item.name),
        child: StoreConnector<List<CartItem>, onToggleStateAction>(
          converter: (store) =>
              (item) => store.dispatch(ToggleStateItemAction(item)),
          builder: (context, callback) => ListTile(
            title: Text(widget.item.name),
            leading: Checkbox(
              value: widget.item.checked,
              onChanged: (value){
                setState(() {
                  callback(CartItem(name: widget.item.name,checked: value));
                });
              },
            ),

          ),
        ),
      ) ,

    );
  }
}

typedef onToggleStateAction = Function(CartItem item);
typedef onItemDeleted = Function(String itemName);
