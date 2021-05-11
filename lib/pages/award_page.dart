
//import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:viz_app/common/app_background.dart';
import 'package:viz_app/common/award_card.dart';
import 'package:viz_app/styleguide/text_styles.dart';
import 'package:viz_transaction/viz_transaction.dart';

class AwardPage extends StatefulWidget{

  @override
  _AwardPageState createState() => _AwardPageState();
}

class _AwardPageState extends State<AwardPage> {

  var _formKey = GlobalKey<FormState>();
  double _currentSliderValue = 20.0;

  Color fieldColor =  Color(0xFF17274d); //121f3d;
  Color textFieldColor =  Color(0xFF0066d7); //121f3d;

  String valReceiver;
  String valMemo;
  double valueViz;

  void initState() {
    super.initState();
   // vizAward();
  }

  void vizAward() {
    Transaction trx = Transaction(
      refBlockNum: 46179,
      refBlockPrefix: 1490075988);

  Award award = Award(
      initiator: AccountName('<INITIATOR_LOGIN>'),
      receiver: AccountName('<RECEIVER_LOGIN>'),
      energy: 1000, // 10.00%
      memo: Memo('Hello World'));

  trx.operations.add(award);
  trx.sign(['<REGULAR_PRIVATE_KEY>']); //Sign transaction

  print(trx.toJsonString()); // And get a json string to broadcast in blockchain
  print('Hello World');
  }

  void submit() async{
    final form = _formKey.currentState;
    if(form.validate()){
      setState(() {
        form.save();
         print('valReceiver ' + valReceiver + ' valMemo ' + valMemo + ' valueViz ' + valueViz.toString());
      });
    }
  }

  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {


    return  Stack(
      children: <Widget>[
        AppBackground(),
        /*Container(
          child: Image.asset(
            "/images/0002.gif",
            fit: BoxFit.fitWidth,
          ),
        ),*/
        Container(
            height: (MediaQuery.of(context).size.height-70.0),
            width: MediaQuery.of(context).size.width,

            child:  FutureBuilder(
                    builder: (context, snapshot){
                      return ListView(
                          scrollDirection: Axis.vertical,
                          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0, bottom: 2.0),
                          children: <Widget>[
                            Container (
                              padding: const EdgeInsets.only(left: 0.0, right: 0.0, top: 0.0, bottom: 2.0),
                              child: Text("Award",  style: headingStyle),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Text("Account: ELON MUSK", style: tituloStyle,),
                            AwardCard(capital: 10.0,energy: 0.82),
                            /*
                            Text("Energy: 9.0 %", style: infoTextStyle,),
                            Text("Social capital: 10.0 Z", style: infoTextStyle,),*/
                            SizedBox(
                              height: 20.0,
                            ),

                            Form(
                              key: _formKey,
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: [
                                      Container(
                                        width: (MediaQuery.of(context).size.width-130.0),
                                        margin: EdgeInsets.only(top: 15.0, left: 20.0, right: 10.0),
                                        child: TextFormField(
                                          style: TextStyle(
                                            color: textFieldColor,
                                          ),
                                          validator: (value){
                                            if(value.isEmpty) {
                                              return "please Enter Receiver";
                                            }else {return null;}
                                          },
                                          onSaved: (val)=> valReceiver = val,
                                          decoration: InputDecoration(
                                              labelText: "Receiver",
                                              labelStyle: TextStyle(
                                                color: textFieldColor,
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: fieldColor, width: 2.0),
                                              ),
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: fieldColor,
                                                    width: 2.0,
                                                  ))),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 15.0, left: 0.0, right: 0.0),
                                        child: Icon(
                                          Icons.qr_code_scanner_rounded,
                                          color: textFieldColor,
                                          size: 40.0,
                                        ),
                                      )
                                    ],
                                  ),

                                 /* Container(
                                    margin: EdgeInsets.only(top: 15.0, left: 0.0, right: 0.0),
                                    child: TextFormField(
                                      controller: transferDataController,
                                      validator: (value){
                                        if(value.isEmpty) {
                                          return "please Enter Amount";
                                        }
                                      },
                                      decoration: InputDecoration(
                                          labelText: "Amount",
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.yellow,
                                                width: 2.0,
                                              ))),
                                    ),
                                  ),*/
                                  Container(
                                    margin: EdgeInsets.only(top: 15.0, left: 20.0, right: 20.0),
                                    child: TextFormField(
                                      style: TextStyle(
                                        color: textFieldColor,
                                      ),
                                      validator: (value){
                                        if(value.isEmpty) {
                                          return "please Enter Memo";
                                        }else {return null;}
                                      },
                                      onSaved: (val)=> valMemo = val,
                                      decoration: InputDecoration(
                                          labelText: "Memo",
                                          labelStyle: TextStyle(
                                            color: textFieldColor,
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: fieldColor, width: 2.0),
                                          ),
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: fieldColor,
                                                width: 2.0,
                                              ))),
                                    ),
                                  ),
                                  Slider(
                                    value: _currentSliderValue,
                                    min: 0,
                                    max: 100,
                                    divisions: 10,

                                    label: _currentSliderValue.round().toString(),
                                    onChanged: (double value) {
                                      setState(() {
                                        _currentSliderValue = value;
                                        valueViz = value;
                                      });
                                    },
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 15.0, left: 20.0, right: 20.0),
                                    child: FlatButton(
                                        padding: EdgeInsets.all(0),
                                        child: Container(
                                          width: MediaQuery.of(context).size.width,
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(4.0)),
                                            gradient: LinearGradient(
                                              colors: <Color>[
                                                Colors.blue,
                                                Color(0xFF17274d),
                                              ],
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black38,
                                                blurRadius: 4,
                                                offset: Offset(2, 8), // Shadow position
                                              ),
                                            ],
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 0.0, vertical: 20.0),
                                          child: Text("Award",textAlign: TextAlign.center, style: whiteLabelTextStyle),
                                        ),
                                        onPressed: (){
                                          if(_formKey.currentState.validate()){
                                             submit();
                                          }
                                        }),
                                  ),

                                ],
                              ),
                            ),
                          ]
                      );
                    }
                )
        ),

      ],
    );
  }
}