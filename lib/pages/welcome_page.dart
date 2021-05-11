
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:viz_app/pages/start_page.dart';
import 'package:viz_app/styleguide/text_styles.dart';
import 'package:url_launcher/url_launcher.dart';

class WelcomePage extends StatelessWidget{
  final formKey = new GlobalKey<FormState>();
  String name = "Anonymous";

  void withoutReg(BuildContext context)async{ //0????????????????????????????????????????????????
    final form = formKey.currentState;
    form.save();
    print("name ");
    print(name);


   // User u = new User(id: 0,name: name, email: "0", password: "0", imagePath: "assets/images/userpic.jpg", caloriesLeaved: 0, durationWorked: 0, trainingHas: 0, userWeight: 50.0, userHeight: 175.0, userAge: 22,  userSex: 1, soundOn: 1 ,premiumOn: 0, rated:0 );
   // await dbA.saveUser(u);
    print("Table user is created");
    //print(u.id);


  //  Mensures m = new Mensures(id: 0, numUsers: 1, userActiveId: u.id);
   // await dbM.insertMensures(m);
    print("Table mensures is created");
    //DatabaseMensures().dbExist=true;

    DateTime today = DateTime.now();
    String lastDate = today.toString();
  //  UserActivity a = new UserActivity(id: 0, workoutsDid: 0, monday1: 0, tuesday2: 0, wednesday3: 0, thursday4: 0, friday5: 0, saturday6: 0, sunday7: 0, lastTrainingDate: lastDate,  armsScore: 0,absScore: 0, backScore: 0,thighScore: 0, stretchingScore: 0, startDate: lastDate, graphActivity: "0000000000");
  //  await dbUA.insertActivity(a);
    print("Table activities is created in welcome page ");
  //  print(a.graphActivity);

    Navigator.push(context, MaterialPageRoute(builder: (context) => StartPage()));
  }

  _launchURL() async {
    const url = 'http://fitzieapp.com/terms.html';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  _launchURLPP() async {
    const url = 'http://fitzieapp.com/privacy.html';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context){
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: Colors.black,
          statusBarIconBrightness: Brightness.light),
    );
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
            body: ListView(
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  /*Container(
              //height: 432.0,

                child: Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 70, bottom: 1.0),
                    child: Image.asset(
                      "assets/images/logo_type_black.jpg",
                      height: 37.0,

                      ),
                    )
                ),
              ),*/
                  SizedBox(height: 10.0,),
                  Padding(
                      padding: EdgeInsets.only( top: 240.0, left: 30.0, right: 30.0),
                      child: Container(
                        //height: MediaQuery.of(context).size.height-200.0,
                          child: Card(
                              color: Colors.white.withOpacity(0.99),
                              semanticContainer: true,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
                              elevation: 10.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                              ),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                  child: Stack(
                                      children: <Widget>[
                                        Padding(
                                            padding:EdgeInsets.only(bottom: 20.0, top: 40.0, left: 30.0, right: 30.0),
                                            child: Center(
                                                child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: <Widget>[
                                                      Text("Welcome!", style: selectedTabStyle),

                                                      SizedBox(height: 16.0,),
                                                      Text("By clicking OK, you agree to our"),
                                                      SizedBox(height: 5.0,),
                                                      GestureDetector(
                                                          child: Container(
                                                            child: Text("Terms of Service", style: TextStyle(decoration: TextDecoration.underline, color: Colors.blue)),
                                                          ),
                                                          onTap: (){
                                                            _launchURL();
                                                          }
                                                      ),
                                                      SizedBox(height: 5.0,),
                                                      Text("and that you have read our "),
                                                      SizedBox(height: 5.0,),
                                                      GestureDetector(
                                                          child: Container(
                                                            child: Text("Privacy Policy", style: TextStyle(decoration: TextDecoration.underline, color: Colors.blue)),
                                                          ),
                                                          onTap: (){
                                                            _launchURLPP();
                                                          }
                                                      ),
                                                      SizedBox(height: 16.0,),
                                                      InkWell(
                                                        onTap: () {
                                                          showDialog(
                                                            context: context,
                                                            builder: (BuildContext context) =>
                                                                _buildNameDialog(
                                                                    context), // "Thigh"
                                                          );
                                                        },
                                                        child: Container(
                                                          decoration: const BoxDecoration(
                                                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                                            color: Colors.blue, //black26
                                                          ),
                                                          padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 9.0),
                                                          child: Text("OK", style: whiteValueTextStyle),
                                                        ),
                                                      ),

                                                      SizedBox(height: 10.0,),
                                                      //Text("Set your data in the Profile tab."),
                                                      /*
                                            Text("If you want to join us and use the full version of the application, click here"),
                                            SizedBox(height: 4.0,),
                                            FlatButton(
                                              onPressed: () {
                                                Navigator.push(context, MaterialPageRoute(builder: (context) => AuthPage()));
                                                //userA.userWeight = counter;

                                              },
                                              textColor: Theme.of(context).primaryColor,
                                              child: Container(
                                                decoration: const BoxDecoration(
                                                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                                  color: Colors.blue,
                                                ),
                                                padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 11.0),
                                                child: Text("Join", style: dataActiveStyle ),
                                              ),
                                            ),*/
                                                    ]
                                                )
                                            )


                                        ),


                                      ]
                                  )
                              )
                          )
/*
                  child: Card(
                      color: Colors.white.withOpacity(0.99),
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
                      elevation: 10.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          child: Stack(
                              children: <Widget>[
                                Padding(
                                    padding:EdgeInsets.only(bottom: 20.0, top: 40.0, left: 30.0, right: 30.0),
                                    child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text("Welcome!", style: selectedTabStyle),

                                          SizedBox(height: 16.0,),
                                          Text("To continue as a guest and explore how the application works click “Continue without registration."),
                                          Text("So application sets random values for your biometric data. You can always change it in the Profile tab."),
                                          SizedBox(height: 6.0,),
                                          FlatButton(
                                            onPressed: () {
                                              //Navigator.push(context, MaterialPageRoute(builder: (context) => LandingPage()));
                                              //userA.userWeight = counter;
                                              withoutReg(context);
                                              //Navigator.push(context, MaterialPageRoute(builder: (context) => LandingPage()));
                                            },
                                            textColor: Theme.of(context).primaryColor,
                                            child: Container(
                                              decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                                color: Colors.black26,
                                              ),
                                              padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
                                              child: Text("Continue without registration", style: dataActiveStyle ),
                                            ),
                                          ),

                                          SizedBox(height: 10.0,),
                                          Text("If you want to join us and use the full version of the application, click here"),
                                          SizedBox(height: 4.0,),
                                          FlatButton(
                                            onPressed: () {
                                              Navigator.push(context, MaterialPageRoute(builder: (context) => AuthPage()));
                                              //userA.userWeight = counter;

                                            },
                                            textColor: Theme.of(context).primaryColor,
                                            child: Container(
                                              decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                                color: Colors.blue,
                                              ),
                                              padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 11.0),
                                              child: Text("Join", style: dataActiveStyle ),
                                            ),
                                          ),
                                        ]
                                    )
                                ),


                              ]
                          )
                      )
                  )*/
                      )
                  )
                ])
        )
    );
  }
  @override
  Widget _buildNameDialog(BuildContext context) {
    return AlertDialog(
      title: Text("How is your name?"),
      content: Container(
        child: LView(context),),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            //Navigator.push(context, MaterialPageRoute(builder: (context) => LandingPage()));
            //userA.userWeight = counter;
            withoutReg(context);
            //Navigator.push(context, MaterialPageRoute(builder: (context) => LandingPage()));
          },
          textColor: Theme.of(context).primaryColor,
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              color: Colors.blue, //black26
            ),
            padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 9.0),
            child: Text("SAVE", style: whiteValueTextStyle),
          ),
        ),
      ],
    );
  }

  @override
  Widget LView(BuildContext context) {
    return Container(
        height: 60.0, // Change as per your requirement
        width: 320.0, // Change as per your requirement
        child: ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              Form(
                  key: formKey,
                  child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: TextFormField(
                            validator: (value){
                              if (value.isEmpty) return 'Please, enter your name';
                            },
                            onSaved: (val)=> name = val,
                            decoration: new InputDecoration(
                              //hintText: 'name',
                                labelText: 'Enter your name'
                            ),
                          ),
                        ),
                      ]
                  )),
              SizedBox(height: 20.0,),

            ]
        )
    );
  }
}