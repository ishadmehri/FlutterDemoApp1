import 'package:flutter/foundation.dart';

class Product {
  int id;
  String imageUrl;
  String title;
  String badgeName = '';
  String badgeColor = '';
  double price;
  double newPrice;

  Product({
      this.id,
      this.imageUrl,
      this.title,
      this.badgeName,
      this.badgeColor,
      this.price,
      this.newPrice
  });
}


class Cart with ChangeNotifier {
  List<Product> products = [];

  double get total {
    return products.fold(0.0, (double currentTotal, Product nextProduct) {
      double productPrice;
      nextProduct.newPrice!=null ? productPrice = nextProduct.newPrice: productPrice = nextProduct.price;

      return currentTotal + productPrice;
    });
  }

  void addToCart(Product product) => products.add(product);
  void removeFromCart(Product product) {
    products.remove(product);
    notifyListeners();
  }
}


class User {
  final String name;
  final String imageUrl;
  final Cart cart;

  User({this.name, this.imageUrl, this.cart});
}


var products = [
  Product(
      id: 1,
      imageUrl:
      "https://dkstatics-public.digikala.com/digikala-products/a70f7f322cb0dc1b29df220a1d89006fe063d240_1611405506.jpg?x-oss-process=image/resize,h_1600/quality,q_80/watermark,image_ZGstdy8xLnBuZw==,t_90,g_nw,x_15,y_15",
      title: "Huawei Y7a PPA-LX2 Dual SIM 128GB And 4GB RAM Mobile Phone",
      price: 6,
      newPrice: 4,
      badgeColor: 'red',
      badgeName: '-25%'
  ),
  Product(
      id: 2,
      imageUrl:
      "https://dkstatics-public.digikala.com/digikala-products/122045219.jpg?x-oss-process=image/resize,m_lfit,h_600,w_600/quality,q_90",
      title: "iPhone SE 2020 A2275 128GB",
      price: 6,
      badgeColor: 'green',
      badgeName: 'Top'
  ),
  Product(
    id: 3,
    imageUrl:
    "https://dkstatics-public.digikala.com/digikala-products/9f5d8f6583a7289a096a9180ac88708856f4bd8f_1607433653.jpg?x-oss-process=image/resize,m_lfit,h_600,w_600/quality,q_90",
    title: "iPhone 12 A2404 128GB ",
    price: 6,
  ),
  Product(
      id: 4,
      imageUrl:
      "https://dkstatics-public.digikala.com/digikala-products/a70f7f322cb0dc1b29df220a1d89006fe063d240_1611405506.jpg?x-oss-process=image/resize,h_1600/quality,q_80/watermark,image_ZGstdy8xLnBuZw==,t_90,g_nw,x_15,y_15",
      title: "Huawei Y7a PPA-LX2 Dual SIM 128GB And 4GB RAM Mobile Phone",
      price: 6,
      newPrice: 4,
      badgeColor: 'red',
      badgeName: '-25%'
  ),
  Product(
      id: 5,
      imageUrl:
      "https://dkstatics-public.digikala.com/digikala-products/122045219.jpg?x-oss-process=image/resize,m_lfit,h_600,w_600/quality,q_90",
      title: "iPhone SE 2020 A2275 128GB",
      price: 6,
      badgeColor: 'green',
      badgeName: 'Top'
  ),
  Product(
    id: 6,
    imageUrl:
    "https://dkstatics-public.digikala.com/digikala-products/9f5d8f6583a7289a096a9180ac88708856f4bd8f_1607433653.jpg?x-oss-process=image/resize,m_lfit,h_600,w_600/quality,q_90",
    title: "iPhone 12 A2404 128GB ",
    price: 6,
  ),
];

List favoriteProducts = [1,3];

User user = new User(
  name: 'Daniel Russo',
  imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5ykZqF82LoinfHAvX7jUCLntjz82BIIdxXw&usqp=CAU',
  cart: Cart()
);
