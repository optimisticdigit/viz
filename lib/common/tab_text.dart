import 'package:flutter/material.dart';
import 'package:viz_app/styleguide/text_styles.dart';

class TabText extends StatelessWidget {
  final bool isSelected;
  final String text;
  final Function onTabTap;
  final IconData iconTab;

  TabText({this.text, this.isSelected, this.onTabTap, this.iconTab});

  @override
  Widget build(BuildContext context){
    return  Transform.rotate(
        angle: 0.0,
        child: GestureDetector(

          onTap: onTabTap,
          child: Container(
            color:  Color(0xFF070b16), //5ee7fb
            padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 4.0),
            child: Column(
                //direction: Axis.vertical,
               // alignment: WrapAlignment.center,
                children: <Widget>[
                  Container(
                    //alignment: Alignment.center,
                    child: Icon(
                      iconTab, //Icons.event_note,
                      color: isSelected ? Colors.lightBlueAccent : Color(0xFF0066d7),
                      size: isSelected ?  24.0 : 26.0,
                    ),
                  ),
                  SizedBox(height:2.0),
                  AnimatedDefaultTextStyle(
                    child: Text(
                      text,
                    ),
                    style: isSelected ? selectedTabStyle2 : labelTextStyle,
                    duration: const Duration(milliseconds: 400),
                  ),

                ]
              )
            ),
          ),
    );
  }
}