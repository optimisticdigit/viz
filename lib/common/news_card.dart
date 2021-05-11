import 'package:flutter/material.dart';

import 'news_card_details.dart';

class NewsCard extends StatelessWidget{
  final String news;   //News news
  NewsCard({this.news});

  @override
  Widget build(BuildContext context){
    return InkWell(
        onTap:(){
         // Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage(training: training)));
        },
        child: SizedBox(
          width: 420.0,
          height: 220.0,
          child: Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              elevation: 8.0,
              color: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                child: Stack(
                  children: <Widget>[
                    Image.asset(
                      "assets/images/new.jpg",
                      fit: BoxFit.fitWidth,
                    ),
                    Positioned(
                      left:0,
                      bottom: 0,
                      right: 0,
                      child: DetailsWidget(description:"VIZ on Coinbase is Aviable Now")
                    ),
                  ],
                ),
              )

          ),
        )
    );


  }
}