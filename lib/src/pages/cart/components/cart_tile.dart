import 'package:flutter/material.dart';
import 'package:greengrocer/src/config/custom_color.dart';
import 'package:greengrocer/src/models/cart_model.dart';
import 'package:greengrocer/src/pages/widgets/quantidade_widget.dart';
import 'package:greengrocer/src/services/utils_services.dart';

class CartTile extends StatefulWidget {
  final CartItemModel cartItem;
  final Function(CartItemModel) remove;

  const CartTile({Key? key, required this.cartItem, required this.remove})
      : super(key: key);

  @override
  State<CartTile> createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {
  final UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: ListTile(
        // Imagem
        leading: Image.asset(
          widget.cartItem.item.imgUrl,
          height: 60,
          width: 60,
        ),

        // Titulo
        title: Text(
          widget.cartItem.item.itemName,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),

        // Total
        subtitle: Text(
          utilsServices.priceToCurrency(widget.cartItem.totalPrice()),
          style: TextStyle(
            color: CustomColors.customSwatColor,
            fontWeight: FontWeight.bold,
          ),
        ),

        // Quantidade

        trailing: QuantidadeWidget(
          isRemovable: true,
          suffixText: widget.cartItem.item.unit,
          value: widget.cartItem.quantidade,
          result: (quantidade) {
            setState(
              () {
                widget.cartItem.quantidade = quantidade;

                if (quantidade == 0) {
                  widget.remove(widget.cartItem);
                }
              },

            );
          },

        ),
      ),
    );
  }
}
