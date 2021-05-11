import 'package:intl/intl.dart';
import 'package:viz_app/data/api_request.dart';
import 'package:viz_app/data/candles.dart';

class CandlesRepository{
  Future<Candles> getCandles(String instrument, String granularity) async {
    final today = DateFormat('yyyy-MM-dd').format(
      DateTime.now(),
    );
    final url = 'https://api-fxpractice.oanda.com/v3/instruments/${instrument}/candles?granularity=$granularity&price=A&from=${today}T00:00&count=40';//'https://api.coincap.io/v2/';

    try{
      final response = await ApiRequest(url:url, data: null).get();
      return Candles.fromJson(response);
    }catch(error){
      throw Exception('Exception occured with error $error');
    }
  }
}