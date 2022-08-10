import 'package:greengrocer/src/models/cart_model.dart';
import 'package:greengrocer/src/models/item_model.dart';
import 'package:greengrocer/src/models/order_model.dart';
import 'package:greengrocer/src/models/user_model.dart';

ItemModel apple = ItemModel(
    descricao:
        'A melhor maçã da região e que conta com o melhor preço de qualquer quitanda',
    imgUrl: 'assets/fruits/apple.png',
    itemName: 'Maçã',
    price: 5.5,
    unit: 'Kg');
ItemModel grape = ItemModel(
  imgUrl: 'assets/fruits/grape.png',
  itemName: 'Uva',
  price: 7.4,
  unit: 'kg',
  descricao:
      'A melhor uva da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel guava = ItemModel(
  imgUrl: 'assets/fruits/guava.png',
  itemName: 'Goiaba',
  price: 11.5,
  unit: 'kg',
  descricao:
      'A melhor goiaba da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel kiwi = ItemModel(
  imgUrl: 'assets/fruits/kiwi.png',
  itemName: 'Kiwi',
  price: 2.5,
  unit: 'un',
  descricao:
      'O melhor kiwi da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel mango = ItemModel(
  imgUrl: 'assets/fruits/mango.png',
  itemName: 'Manga',
  price: 2.5,
  unit: 'un',
  descricao:
      'A melhor manga da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel papaya = ItemModel(
  imgUrl: 'assets/fruits/papaya.png',
  itemName: 'Mamão papaya',
  price: 8,
  unit: 'kg',
  descricao:
      'O melhor mamão da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

// Lista de produtos
List<ItemModel> items = [
  apple,
  grape,
  guava,
  kiwi,
  mango,
  papaya,
];

List<String> categories = [
  'Frutas',
  'Grãos',
  'Verduras',
  'Temperos',
  'Cereais',
];

List<CartItemModel> cartItems = [
  CartItemModel(item: apple, quantidade: 1),
  CartItemModel(item: mango, quantidade: 1),
  CartItemModel(item: guava, quantidade: 3),
];

UserModel user = UserModel(
    nome: 'Erick',
    email: 'erick_dosreis@hotmail.com',
    telefone: '13 99999999',
    cpf: '6678678687768876',
    senha: 'Julieti15');

List<OrderModel> orders = [
  // Pedido 1
  OrderModel(
    copyAndPaste: '123sadds132',
    createdDateTime: DateTime.parse(
      '2023-07-08 10:00:10.458',
    ),
    overdueDateTime: DateTime.parse(
      '2023-07-08 11:00:10.458',
    ),
    id: '32113231231',
    status: 'pending_payment',
    total: 11.0,
    items: [
      CartItemModel(
        item: apple,
        quantidade: 2,
      ),
      CartItemModel(
        item: mango,
        quantidade: 2,
      ),
    ],
  ),

  // Pedido 2
  OrderModel(
    copyAndPaste: '123sadds132',
    createdDateTime: DateTime.parse(
      '2023-09-08 10:00:10.458',
    ),
    overdueDateTime: DateTime.parse(
      '2023-07-30 11:00:10.458',
    ),
    id: '32113231231',
    status: 'delivered',
    total: 11.0,
    items: [

      CartItemModel(
        item: guava,
        quantidade: 2,
      ),
    ],
  ),
];
