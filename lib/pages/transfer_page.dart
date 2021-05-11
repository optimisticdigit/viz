
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:viz_app/common/app_background.dart';
import 'package:viz_app/common/transfer_card.dart';
import 'package:viz_app/styleguide/text_styles.dart';
//import 'package:viz_transaction/viz_transaction.dart';


class TransferPage extends StatefulWidget{

  @override
  _TransferPageState createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  var _formKey = GlobalKey<FormState>();

  Color fieldColor =  Color(0xFF17274d);
  Color textFieldColor =  Color(0xFF0066d7);

  String valReceiver;
  String valMemo;
  String valueViz;

  void initState() {
    super.initState();
   // vizTransaction();
  }

 /*void vizTransaction() {
    Transaction trx = Transaction();
    trx.refBlockNum = 46179;
    trx.refBlockPrefix = 1490075988;

    Transfer transfer = Transfer(
        from: AccountName('<SENDER_LOGIN>'),
        to: AccountName('<RECEIVER_LOGIN>'),
        amount: VizAsset.fromString('1.000 VIZ'),
        memo: Memo('Hello world!'));

    trx.operations.add(transfer);
    trx.sign(['<ACTIVE_PRIVATE_KEY>']); //Sign transaction

    // And get a json string to broadcast in blockchain
    print(trx.toJsonString());
  }*/
  void submit() async{
    final form = _formKey.currentState;
    if(form.validate()){
      setState(() {
        form.save();
        print('valReceiver ' + valReceiver + ' valMemo ' + valMemo + ' valueViz ' + valueViz);
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
                      child: Text("Transfer",  style: headingStyle),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text("Account: ELON MUSK", style: tituloStyle,),
                    TransferCard(capital: 10.0,energy: 0.82),
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
                                width: (MediaQuery.of(context).size.width-115.0),
                                margin: EdgeInsets.only(top: 15.0, left: 0.0, right: 0.0),
                                child: TextFormField(
                                  onSaved: (val)=> valReceiver = val,
                                  style: TextStyle(
                                    color: textFieldColor,
                                  ),
                                  validator: (value){
                                    if(value.isEmpty) {
                                      return "please Enter Receiver";
                                    }
                                  },
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
                                margin: EdgeInsets.only(top: 15.0, left: 15.0, right: 0.0),
                                child: Icon(
                                  Icons.qr_code_scanner_rounded,
                                  color: textFieldColor ,
                                  size: 40.0,
                                ),
                              )
                            ],
                          ),

                          Container(
                            margin: EdgeInsets.only(top: 15.0, left: 0.0, right: 0.0),
                            child: TextFormField(
                              onSaved: (val)=> valueViz = val,
                              style: TextStyle(
                                color: textFieldColor,
                              ),
                              validator: (value){
                                if(value.isEmpty) {
                                  return "please Enter Amount";
                                }
                              },
                              decoration: InputDecoration(
                                  labelText: "Amount",
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
                            child: TextFormField(
                              onSaved: (val)=> valMemo = val,
                              style: TextStyle(
                                color: textFieldColor,
                              ),
                              validator: (value){
                                if(value.isEmpty) {
                                  return "please Enter Memo";
                                }
                              },
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
                          Container(
                            margin: EdgeInsets.only(top: 35.0),
                            child: FlatButton(
                                padding: EdgeInsets.all(0),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                                    gradient: LinearGradient(
                                      colors: <Color>[
                                        Colors.orangeAccent,
                                        Colors.deepOrange,
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
                                  child: Text("Transfer",textAlign: TextAlign.center, style: whiteLabelTextStyle),
                                ),
                                onPressed: (){
                              if(_formKey.currentState.validate()){
                                submit();
                              }
                            }),
                          )
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