import 'package:flutter/material.dart';
import 'package:viz_app/styleguide/text_styles.dart';

import 'news_card_details.dart';

class AwardCard extends StatelessWidget{
  final double capital;
  final double energy;
  AwardCard({this.capital, this.energy});

  @override
  Widget build(BuildContext context){
    return InkWell(
        onTap:(){
          //Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage(training: training)));
        },
        child: SizedBox(
          width: 320.0,
          height: 240.0,
          child: Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              margin: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 20.0),
              elevation: 16.0,
              color: Color(0xFF010a19),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                child: Stack(
                  children: <Widget>[
                    Image.asset(
                      "assets/images/0003.gif",
                      fit: BoxFit.fitWidth,
                    ),
                    Positioned(
                      left:0,
                      bottom: 24.0,
                      child: NameWidget(capital),
                    ),
                    Positioned(
                      left:0,
                      right: 0,
                      bottom: 10.0,
                      child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 20.0),
                          width: MediaQuery.of(context).size.width,
                          height: 3.0,
                          child: LinearProgressIndicator(
                            value: energy,
                            backgroundColor: Color(0xFF010a19),
                          ),
                      )
                    ),

                  ],
                ),
              )

          ),
        )
    );
  }
  Widget NameWidget(valueCapital) {
    return  Padding(
        padding: const EdgeInsets.only(top: 10.0, left: 16.0, right: 24.0, bottom: 10.0),
        child: Wrap(
          direction: Axis.vertical,
          children: <Widget>[
            Text(
              "Social capital:",
              style: infoTextStyle,
            ),
            Text(
              valueCapital.toStringAsFixed(2) + " Ƶ",
              style: capitalStyle,
            ),
            SizedBox(height: 10.0,),
            Text(
              "Energy: " + (energy*100).toStringAsFixed(1)+ " %",
              style: tituloStyle,
            ),
          ],
        )

      );
  }
}