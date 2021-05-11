import 'package:flutter/material.dart';
import 'package:viz_app/styleguide/text_styles.dart';

class DetailsWidget extends StatelessWidget{
  String description;
  DetailsWidget({this.description});


  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: Container(
          color: Colors.black87,
          height:  40.0,
          padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 8.0, bottom: 5.0),
          child:Column(
              children: <Widget>[
                Text (description, style: whiteLabelTextStyle ,)
              ]
          )
      ),
    );
  }
}