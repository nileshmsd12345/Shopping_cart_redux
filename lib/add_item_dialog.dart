import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:shopping_cart/model/cart_item.dart';
import 'package:shopping_cart/redux/actions.dart';

class AddItemDialog extends StatefulWidget {
  @override
  _AddItemDialogState createState() => _AddItemDialogState();
}

class _AddItemDialogState extends State<AddItemDialog> {
  String itemName;
  @override
  Widget build(BuildContext context) {
    return StoreConnector<List<CartItem>, OnItemAddedCallback>(
      converter: (store) => (itemName) => store
          .dispatch(AddItemAction(CartItem(name: itemName, checked: false))),
      builder: (context, callback) => AlertDialog(
        title: Text("Add Item"),
        contentPadding: EdgeInsets.all(16.0),
        content: Row(
          children: [
            Expanded(
              child: TextField(
                autofocus: true,
                decoration: InputDecoration(
                  labelText: "Item Name",
                  hintText: "Eg. Iphone",
                ),
                onChanged: (value){
                  setState(() {
                    itemName= value;
                  });
                },
              ),
            ),
          ],
        ),
        actions: [
          FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel")),
          FlatButton(
              onPressed: () {
                callback(itemName);
                Navigator.of(context).pop();
              },
              child: Text("Add")),
        ],
      ),
    );
  }
}

typedef OnItemAddedCallback = Function(String itemName);
