import 'package:flutter/material.dart';

class FilterXD extends StatefulWidget{

  Color color1,color2;

  FilterXD(this.color1,this.color2);

  @override
  State createState() {
    return _FilterXDState();
  }
}

class _FilterXDState extends State<FilterXD> {

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 21,
          height: 2,
          color: widget.color1,
        ),
        SizedBox(height: 3,),
        Container(
          width: 14,
          height: 2.4,
          color: widget.color2,
        ),
        SizedBox(height: 3,),
        Container(
          width: 4,
          height: 2,
          color: widget.color1,
        ),
      ],
    );
  }
}