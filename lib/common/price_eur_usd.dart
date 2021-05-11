import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:viz_app/data/candles.dart';
import 'package:viz_app/data/candles_state.dart';
import 'package:viz_app/styleguide/text_styles.dart';

class PriceEurUsd extends StatefulWidget{
  @override
  _PriceEurUsdState createState() => _PriceEurUsdState();
}

class _PriceEurUsdState extends State<PriceEurUsd> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
      CandlesBloc()
        ..add(
          CandlesEventStated('EUR_USD', 'S5'),
        ),
      child: Container(
        child: BlocBuilder<CandlesBloc, CandlesState>(
            builder: (context, state) {
              if (state is CandlesLoading) {
                return Center(
                  child: CircularProgressIndicator(), //Platform.isAndroid ? CircularProgressIndicator() : CupertinoActivityIndicator(),
                );
              } else if (state is CandlesLoaded) {
                Candles candles = state.candles;
                final List<CandlesData> candleData = [];
                int index = 0;
                for (Candle candle in candles.candles) {
                  candleData.add(
                      CandlesData(
                        index: '${index++}',
                        ask: double.parse(candle.candleItem.close),
                      )
                  );
                }
                return Column(
                  children: <Widget>[
                    Container(
                      color: Colors.transparent,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      height: 260,
                      child: Card(
                        color: Colors.transparent,
                        elevation: 0,
                        child: SfCartesianChart(
                          backgroundColor: Colors.transparent,
                          title: ChartTitle(
                            text: 'Euro / U.S. Dollar',
                            textStyle: buttonStyle,
                          ),
                          primaryXAxis: CategoryAxis(
                            labelStyle: buttonStyle,
                          ),
                          primaryYAxis: NumericAxis(
                            labelStyle: buttonStyle,
                          ),
                          series: <ChartSeries<CandlesData, String>>[
                            SplineSeries(
                              color: Colors.red[500],
                              width: 6,
                              dataSource: candleData,
                              xValueMapper: (CandlesData c, _) => c.index,
                              yValueMapper: (CandlesData c, _) => c.ask,
                              animationDuration: 6500,
                            ),
                          ],

                        ),
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          granularitySelect(context, '5S', 'S5'),
                          granularitySelect(context, '15S', 'S15'),
                          granularitySelect(context, '30S', 'S30'),
                          granularitySelect(context, '1M', 'M1'),
                          granularitySelect(context, '15M', 'M15'),
                          granularitySelect(context, '30M', 'M30'),
                        ],
                      ),
                    )
                  ],
                );
              } else {
                return Center(child: Text('Connection Error'));
              }
            }
        ),
      ),
    );
  }

  /*void selectGran (){
    setState(() {
      selectedGranularity = title;
      context.read<CandlesBloc>()..add(CandlesEventStated('EUR_USD', granularity ),);
    });
  }*/

  Widget granularitySelect(BuildContext context, String title,
      String granularity) {
    String selectedGranularity;
    return InkWell(
        onTap: () {
          setState(() {
            selectedGranularity = title;
            context.read<CandlesBloc>()
              ..add(CandlesEventStated('EUR_USD', granularity),);
          });
        },
        child: Container(
          padding: EdgeInsets.all(8),
          margin: EdgeInsets.only(right: 5),
          decoration: BoxDecoration(
              color: Colors.white,
              border: (selectedGranularity == title) ? Border.all(
                color: Colors.red[500],
              ) : null,
              borderRadius: BorderRadius.all(
                Radius.circular(6),
              )
          ),
          child: Text(
            title,
            style: valueTextStyle,
          ),
        )
    );
  }
}


class CandlesData {
  final String index;
  final double ask;
  CandlesData({this.index, this.ask});
}