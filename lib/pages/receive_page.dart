import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:viz_app/common/app_background.dart';
import 'package:viz_app/styleguide/text_styles.dart';


class ReceivePage extends StatefulWidget{

  @override
  _ReceivePageState createState() => _ReceivePageState();
}

class _ReceivePageState extends State<ReceivePage> {
  String _scanBarcode = 'Unknown';

  void initState() {
    super.initState();
  }

  startBarcodeScanStream() async {
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
        "#ff6666", "Cancel", true, ScanMode.BARCODE)
        .listen((barcode) => print(barcode));
  }

  Future<void> scanQR() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "Cancel", true, ScanMode.QR);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    if (!mounted) return;
    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "Cancel", true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    if (!mounted) return;
    setState(() {
      _scanBarcode = barcodeScanRes;
    });
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
            child: FutureBuilder(
                    builder: (context, snapshot){
                      return ListView(
                          padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0, bottom: 2.0),
                          scrollDirection: Axis.vertical,
                          children: <Widget>[
                            Container (
                              padding: const EdgeInsets.only(left: 0.0, right: 0.0, top: 0.0, bottom: 2.0),
                              child: Text("Receive",  style: headingStyle),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),

                            Text("Account: ELON MUSK", style: tituloStyle,),

                            SizedBox(
                              height: 20.0,
                            ),

                            Container(
                              alignment: Alignment.center,
                              child: Flex(
                                direction: Axis.vertical,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                 Container(
                                        width: 280.0,
                                        height: 280.0,
                                        alignment: Alignment.center,
                                        child:   InkWell(
                                          onTap: () => scanQR(),
                                          child:Card(
                                              semanticContainer: true,
                                              clipBehavior: Clip.antiAliasWithSaveLayer,
                                              //margin: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
                                              elevation: 16.0,
                                              //color: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                              ),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                                child: Stack(
                                                  children: <Widget>[
                                                    Image.asset(
                                                      "assets/images/qr.jpg",
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ],
                                                ),
                                              )
                                          ),
                                        ),
                                  ),
                                  /*RaisedButton(
                                  onPressed: () => scanBarcodeNormal(),
                                  child: Text("Start barcode scan")),*/
                                  /*RaisedButton(
                                  onPressed: () => scanQR(),
                                  child: Text("Start QR scan")),*/
                                  /*RaisedButton(
                                  onPressed: () => startBarcodeScanStream(),
                                  child: Text("Start barcode scan stream")),*/
                                  Text('Press image to start QR scan',
                                    style: tituloStyle,),
                                  SizedBox (height: 20.0,),
                                  Text('Scan result : $_scanBarcode\n',
                                      style: tituloStyle,),
                                ]
                              )
                            ),
                            SizedBox(height: 10),
                          ]
                      );
                    }
            )
        )
      ],
    );
  }
}