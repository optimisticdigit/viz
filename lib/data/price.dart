import 'package:viz_app/data/asks.dart';
import 'package:viz_app/data/bid.dart';

class Price{
  final String type;
  final String time;
  final Bids bids;
  final Asks asks;
  final String closeoutBid;
  final String closeoutAsk;
  final bool tradeable;
  final String instrument;
  Price({this.type, this.time, this.bids, this.asks, this.closeoutBid, this.closeoutAsk, this.tradeable, this.instrument,});

  factory Price.fromJson(dynamic json){
    if (json == null){
      return Price();
    }
    return Price(
      type: json['type'],
      time: json['time'],
      bids: json['bids'],
      asks: json['asks'],
      closeoutBid: json['closeoutBid'],
      closeoutAsk: json['closeoutAsk'],
      tradeable: json['tradeable'],
      instrument: json['instrument'],
    );
  }

}
