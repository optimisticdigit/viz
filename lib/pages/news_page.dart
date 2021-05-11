
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:viz_app/common/app_background.dart';
import 'package:viz_app/common/exchange_coins.dart';
import 'package:viz_app/common/exchange_diff_coins.dart';
import 'package:viz_app/common/news_card.dart';
import 'package:viz_app/common/price_eur_usd.dart';
import 'package:viz_app/styleguide/text_styles.dart';


class NewsPage extends StatefulWidget{

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {

  void initState() {
    super.initState();
  }


  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

      return  Stack(
        children: <Widget>[
          AppBackground(),
          Container(
              height: (MediaQuery.of(context).size.height-70.0),
              width: MediaQuery.of(context).size.width,
              child:
                    FutureBuilder(
                        builder: (context, snapshot){
                          return ListView(
                              padding: const EdgeInsets.only(left: 0.0, right: 0.0, top: 30.0, bottom: 0.0),
                              scrollDirection: Axis.vertical,
                              children: <Widget>[
                                Container (
                                    width: MediaQuery.of(context).size.width,
                                    padding: const EdgeInsets.only(left: 20.0, right: 0.0, top: 0.0, bottom: 2.0),
                                    child: Text("News",  style: headingStyle),
                                  ),
                                SizedBox(
                                   height: 20.0,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 240.0,
                                  color: Color(0xFF070b16),
                                  child: NewsCard(),
                                ),
                                ExchangeCoins(coupleName:"VIZ / USDT", volume: 7714.44, value: 48.9, valueDol: 48.9, profit: 11.52),
                                ExchangeDiffCoins(coupleName:"VIZ / BTC",  volume: 1714.44, value: 18.9, valueDol: 18.9, profit: 1.88),
                                ExchangeCoins(coupleName:"VIZ / CHZ", volume:  1223.1, value: 12.9, valueDol: 12.9, profit: 0.52),
                                trade(context),
                                SizedBox(height: 10),
                              ]
                          );
                        }
                    )
              ),
        ],
      );
    }

  @override
  Widget trade(BuildContext context) {

      return Container (
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget> [
            SafeArea(
              child: Container(
                child: Column(
                  children: <Widget>[
                     PriceEurUsd(),
                  ],
                ),
              ),
            ),
          ],
        ),
      );

    }
  }

