import 'package:flutter/material.dart';
import 'package:viz_app/styleguide/text_styles.dart';


class ExchangeCoins extends StatelessWidget{
  final String coupleName;
  final double volume;
  final double value;
  final double valueDol;
  final double profit;
  ExchangeCoins({this.coupleName, this.volume, this.value, this.valueDol, this.profit });


  @override
  Widget build(BuildContext context){
    return Container(
        padding: const EdgeInsets.only(left: 0.0, right: 0.0, top: 10.0, bottom: 10.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black54, width: 1.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          //direction: AxisDirection.left,
          children: <Widget> [
            Column(
              children: <Widget> [
                Text(coupleName, style: tituloStyle,),
                Text("Vol " + volume.toStringAsFixed(1), style: description,),
              ],
            ),

            Column(
              children: <Widget> [
                Text(value.toStringAsFixed(2), style: tituloStyle2,),
                Text("\$ "+ valueDol.toStringAsFixed(2), style: description,),
              ],
            ),
            Container(
              width: 120,
              margin: EdgeInsets.only(top: 5.0, left: 10.0, right: 10.0, bottom: 5.0),
              child: ElevatedButton(
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green) ),
                  //color: Colors.blueAccent,
                  onPressed: null, //()=> scanBarcodeNormal(),
                  child: Text("+" + profit.toStringAsFixed(2), style: valueTextStyle)),
            ),
          ],
        )
    );
  }
}