import 'package:flutter/material.dart';

class CustomIconButton extends StatefulWidget {
  final double width,height;
  final BorderRadius border;
  final Function onTap;
  final Color buttonColor;
  final Icon icon;

  CustomIconButton({this.width, this.height, this.border, this.onTap,
      this.buttonColor, this.icon});

  @override
  _CustomIconButtonState createState() => _CustomIconButtonState();

}

class _CustomIconButtonState extends State<CustomIconButton> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: widget.border,
      child: Container(
        width: widget.width,
        height: widget.height,
        color: widget.buttonColor,
        child: GestureDetector(
          onTap: widget.onTap,
          child: widget.icon,
        ),
      ),
    );
  }
}


bool checkIsAlreadyInFavorites(favorites, index){
  return favorites.contains(index);
}
