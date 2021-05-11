import 'package:viz_app/data/api_request.dart';
import 'package:viz_app/data/price.dart';

class PriceRepository {
  final String accountNr = 'OANDA-ACCOUNT_ID';
  final String instruments = 'EUR_USD, GBR_USD'; //BTC_USD
  //PriceRepository({this.accountNr, this.instruments});

  Future <List<Price>> getPriceList() async {
    final url = 'https://api-fxpractice.oanda.com/v3/accounts/$accountNr/pricing?instruments=$instruments'; //'https://api.coincap.io/v2/';
    final response = await ApiRequest(url: url).get();
    List <Price> prices = (response['prices'] as List)?.map((p) => Price.fromJson(p))?.toList() ?? List.empty();
    return prices;
  }
  Future <Price> getPrice(String instrument) async {
    final url = 'https://api-fxpractice.oanda.com/v3/accounts/$accountNr/pricing?instruments=$instruments'; //'https://api.coincap.io/v2/';
   final response = await ApiRequest(url: url).get();
    return Price.fromJson(response['prices'][0]);
  }
}