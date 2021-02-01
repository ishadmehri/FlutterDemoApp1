import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/model/model.dart';
import 'package:flutter_app/widgets/CustomIconButton.dart';
import 'package:flutter_app/widgets/ProductPrice.dart';
import '../style.dart';

class ProductCard extends StatefulWidget {
  final Product product;
  final int index;

  ProductCard({this.product, this.index});

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8)),
          ),
          Positioned(
            top: 30,
            child: CachedNetworkImage(
                imageUrl: this.widget.product.imageUrl, width: 170, height: 150),
          ),
          if (this.widget.product.badgeName != null)
            Positioned(
              top: 30,
              left: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: defaultColors[this.widget.product.badgeColor],
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(8.0),
                      bottomRight: Radius.circular(8.0)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    this.widget.product.badgeName,
                    style: badgeLabelStyle,
                  ),
                ),
              ),
            ),
          Positioned(
            top: 130,
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                child: Container(
                  height: 60,
                  color: Colors.white.withOpacity(0.6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton.icon(
                          label: Text(
                            'Add To Cart',
                            style: TextStyle(
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                            ),
                            primary: Colors.blue[900],
                            backgroundColor: Colors.blue[200].withOpacity(.5),
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            textStyle: TextStyle( decoration: TextDecoration.none),
                          ),

                          icon: Icon(Icons.shopping_cart_sharp, size: 18,),
                          onPressed: () {
                            print('Pressed');
                          }),
                      SizedBox(width: 10,),
                      CustomIconButton(
                        width: 40,
                        height: 40,
                        buttonColor: Colors.red[50],
                        border: BorderRadius.circular(10),
                        icon: Icon(
                          checkIsAlreadyInFavorites(favoriteProducts, widget.index)  ?
                            Icons.favorite_border :
                            Icons.favorite,
                          color: Colors.red,
                          size: 18,
                        ),
                        onTap: (){
                          if( checkIsAlreadyInFavorites(favoriteProducts, widget.index) ){
                            setState(() {
                              favoriteProducts.remove(widget.index);
                            });
                            print("loved before");
                          }else{
                            setState(() {
                              favoriteProducts.add(widget.index);
                            });
                            print("love now");
                          }
                        },
                      ),
                    ],

                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 15,
            top: 180,
            child: Flex(
              direction: Axis.horizontal,
              children: [
                Container(
                  constraints: BoxConstraints(
                    maxWidth: 200,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        this.widget.product.title,
                        textAlign: TextAlign.center,
                        style: productTitleStyle,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 240,
            child: ProductPrice(this.widget.product.price, this.widget.product.newPrice)
          ),
        ],
      ),
    );
  }
}
