import 'package:flutter/material.dart';

class AppBackground extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(
      builder: (context, constraint){
        //final height = constraint.maxHeight;
        // final width = constraint.maxWidth;

        return Stack(
          children: <Widget>[
            Container(
              //color: Colors.blueGrey[900],
          decoration: BoxDecoration(
            //color: Colors.blue,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomLeft,
              colors: <Color>[
                Color(0xFF070b16),
                Color(0xFF0f1d34),Color(0xFF070b16)
            ],
            ),))
          ],
        );
      },
    );
  }
}