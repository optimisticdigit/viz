
import 'package:path/path.dart' as pathFile;
import 'dart:io' as io;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:viz_app/common/app_background.dart';
import 'package:image_picker/image_picker.dart';
import 'package:viz_app/common/settings_button.dart';
import 'dart:io';

import 'package:viz_app/styleguide/text_styles.dart';

class SettingsPage extends StatefulWidget{

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String imagePath = "assets/images/userpic2.jpg";
  File _image= null;

  void initState() {
    super.initState();
  }

/*
  Future getImage( ) async {
    try {
      io.Directory documentDirectory = await getApplicationDocumentsDirectory();
      String path2 = await documentDirectory.path;
      var image = await ImagePicker.pickImage(
          source: ImageSource.gallery); // var image
      String fileName = pathFile.basename(
          image.path); //pathFile.basenameWithoutExtension(image.path);
      final File newImage = await image.copy('$path2/$fileName');
      this.setState(() {
        _image = newImage;
        print("Your selected image is " + newImage.path);
        imagePath = newImage.path;
        //u.imagePath = imagePath;
      });
      //await dbA.updateUser(u);
      //print("Your saved path is " + u.imagePath);
    } catch (e){
      print("Image error");
      imagePath = "assets/images/userpic.jpg";
      //u.imagePath = imagePath;
      //await dbA.updateUser(u);
    }
    print(imagePath + " image path ");
  }*/

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
                    padding: const EdgeInsets.only(left:40.0, right: 40.0, top: 20.0, bottom: 20.0),
                  scrollDirection: Axis.vertical,
                  children: <Widget>[
                    SizedBox( height: 10.0,),
                    FlatButton( // image UserPic
                      onPressed: () {
                      //getImage( );
                      },
                      textColor: Theme.of(context).primaryColor,
                      child:  Container(   // image UserPic
                        width: 380.0,
                        height: 180.0,
                        //color: Colors.greenAccent,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                width: 150.0,
                                height: 150.0,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color:Colors.white,
                                  image:DecorationImage(
                                    fit: BoxFit.cover,  //BoxFit.fill
                                    image:  _image != null ? FileImage(_image):
                                    ExactAssetImage(
                                      imagePath)
                                  ),
                                  border: new Border.all(width: 0.0, color: Colors.black),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      offset: Offset(1.0, 2.0),
                                      blurRadius: 7.0,
                                    ),
                                  ],
                                )
                            ),
                          ],
                        )
                      ),
                    ),
                    Container(
                      width: 280.0,
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Text("ELON MUSK" + "!", style: selectedTabStyle),
                      )
                    ),

                    Container(
                        width: 280.0,
                        height: 46.0,
                        padding: EdgeInsets.only(left:0.0, right: 0.0, top: 10.0, bottom: 10.0),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Text("Account created at 2/4/21", style: description,),
                        )
                    ),
                    SettingsButtonWidget(name:"Telegram support chat",iconButton:Icons.support,),
                    SettingsButtonWidget(name:"Change Language",iconButton:Icons.settings,),
                    SettingsButtonWidget(name:"Log out",iconButton:Icons.person,),
                    ]
                  );
                }
              ),
            )
      ],
    );
  }
}