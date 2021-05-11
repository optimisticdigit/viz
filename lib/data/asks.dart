class Asks{
  final List<Ask> ask;
  Asks({this.ask});
}

class Ask{
  final String price;
  final int liquidity;
  Ask({this.price, this.liquidity});

  factory Ask.fromJson(dynamic json){
    if (json == null){
      return Ask();
    }
    return Ask(
      price: json['price'],
      liquidity: json['liquidity'],
    );
  }
}