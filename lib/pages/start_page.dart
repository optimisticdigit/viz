import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:viz_app/common/app_background.dart';
import 'package:viz_app/common/horizontal_tab_layout.dart';
import 'package:viz_app/pages/welcome_page.dart';


class StartPage extends StatefulWidget{

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {

  bool isExist = true;
  int option =1;

/*
  void existOrNo()async{
    Mensures m = await dbM.getMensures(0); // new Mensures(id: 0, numUsers: 1, userActiveId: u.id);
    if (m == null){
      print("mensures es null");
      setState(() {
        isExist = false;
        option = 2;
      });
    } else {
      print("mensures no es null");
      setState(() {
        isExist = true;
        option = 1;
      });
    }
  }*/

  void initState() {
    super.initState();
    //existOrNo();

  }


  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: Colors.black,
          statusBarIconBrightness: Brightness.light),
    );

    return  MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(

          body: Stack(
            children: <Widget>[
              AppBackground(),
              _startPage(context, isExist),
            ],
          ),
        )
    );
  }

  @override
  Widget _startPage(BuildContext context, bool exist) {
    print("exist is");
    print(exist);
    if (exist != null) {
      if (option == 2) {
        return Align(
          alignment: Alignment.center,
          child: WelcomePage(),
        );
      }
      if (option == 1) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: HorizontalTabLayout(),
        );
      }
      if (option == 0) {
        return Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,

            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
              //color: Colors.blue,
              gradient: LinearGradient(
                // Where the linear gradient begins and ends
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                // Add one stop for each color. Stops should increase from 0 to 1
                stops: [0.1, 0.5, 0.7, 0.9],
                colors: [
                  // Colors are easy thanks to Flutter's Colors class.
                  Colors.pinkAccent,
                  Colors.indigoAccent,
                  Colors.lightBlueAccent,
                  Colors.blue[200],
                ],
              ),
              /*image: DecorationImage(
              image: AssetImage('assets/images/welcome_page.jpg'),
              fit: BoxFit.fitHeight,
            ),*/
            ),
            child: Scaffold(
                backgroundColor: Colors.transparent,
                body: Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 0, bottom: 0),
                      child: null
                      /*Image.asset(
                        "assets/images/logo_type_white.png",
                        height: 54.0,
                      ),*/
                    )
                )
            )
        );
      }
    } else {
     // dbM.dbMExist = true;
      return Align(
        alignment: Alignment.center,
        child: WelcomePage(),
      );
    }
  }
}