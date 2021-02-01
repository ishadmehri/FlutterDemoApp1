import 'package:flutter/material.dart';

class ProductPrice extends StatelessWidget {
  final double price,newPrice;

  ProductPrice(this.price, this.newPrice);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        if (this.newPrice == null)
          Text(
            '\$${this.price} ',
            style: new TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16
            ),
          )
        else
          Text.rich(
            TextSpan(
              text: '',
              children: <TextSpan>[
                new TextSpan(
                  text: '\$${this.newPrice} ',
                  style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                new TextSpan(
                  text: '\$${this.price}',
                  style: new TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
