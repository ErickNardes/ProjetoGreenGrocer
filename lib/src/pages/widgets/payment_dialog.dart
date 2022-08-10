import 'package:flutter/material.dart';
import 'package:greengrocer/src/models/order_model.dart';
import 'package:greengrocer/src/services/utils_services.dart';
import 'package:qr_flutter/qr_flutter.dart';

class PaymentDialod extends StatelessWidget {
  final OrderModel order;
  final UtilsServices utilsServices = UtilsServices();

  PaymentDialod({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Conteudo
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                 const Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: const Text(
                      'Pagamento via Pix',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),

                  //QR Code
                  QrImage(
                    data: 'sdaasdsasaasda',
                    version: QrVersions.auto,
                    size: 200,
                    gapless: false,
                  ),

                  // Vencimento

                  Text(
                    'Vencimento: ${utilsServices.formatDateTime(order.overdueDateTime)}',
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),

                  // Total
                  Text(
                    'Total: ${utilsServices.priceToCurrency(order.total)}',
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.bold),
                  ),

                  //Botão

                  OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      side: const BorderSide(width: 2, color: Colors.green),
                    ),
                    onPressed: () {},
                    icon:const Icon(
                      Icons.copy,
                      size: 15,
                    ),
                    label:const Text(
                      'Copiar código Pix',
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                ],
              ),
            ),

            Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.close),
              ),
            ),
          ],
        ));
  }
}
