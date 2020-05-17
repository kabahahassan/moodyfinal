import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon, @required this.onPressed});

  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 5.0,
      child: Icon(
        icon,
        size: 35,
      ),
      onPressed: onPressed,
      constraints: BoxConstraints.tightFor(
        width: 70.0,
        height: 70.0,
      ),
      shape: CircleBorder(),
      fillColor: Colors.white,
    );
  }
}
