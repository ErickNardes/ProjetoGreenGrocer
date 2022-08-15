import 'package:greengrocer/src/models/item_model.dart';

class CartItemModel{
  ItemModel item;
  int quantidade;
  CartItemModel({required this.item,required this.quantidade,});

  totalPrice()  =>  item.price * quantidade;

}