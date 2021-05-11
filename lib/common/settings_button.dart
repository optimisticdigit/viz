import 'package:flutter/material.dart';
import 'package:viz_app/styleguide/text_styles.dart';

class SettingsButtonWidget extends StatelessWidget{
  String name;
  final IconData iconButton;
  SettingsButtonWidget({this.name, this.iconButton});

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: Container(
        width: 280.0,
        padding: EdgeInsets.only(left:0.0, right: 0.0, top: 10.0, bottom: 10.0),
        child:  FlatButton(
          padding: EdgeInsets.all(0),
          onPressed: (){
            //sendMessage();
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
              gradient: LinearGradient(
                colors: <Color>[
                  Colors.blue,
                  Colors.lightBlueAccent,
                ],
              ),
            ),
            padding: const EdgeInsets.symmetric(
                horizontal: 22.0, vertical: 14.0),
            child: Row(
              //spacing: 10.0,
                children: <Widget>[
                  Icon(
                    iconButton, // Icons.support,
                    color:  Colors.white,
                    size: 26.0,
                  ),

                  SizedBox( width: 10.0,),
                  Text(name, style: whiteLabelTextStyle, ), //"Telegram support chat"
                ]
            ),
          ),
        ),
      ),
    );
  }
}