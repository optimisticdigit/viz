import 'package:flutter/material.dart';
import 'package:viz_app/common/tab_text.dart';
import 'package:viz_app/pages/award_page.dart';
import 'package:viz_app/pages/news_page.dart';
import 'package:viz_app/pages/receive_page.dart';
import 'package:viz_app/pages/settings_page.dart';
import 'package:viz_app/pages/transfer_page.dart';

class HorizontalTabLayout extends StatefulWidget {

  @override
  _HorizontalTabLayoutState createState() => _HorizontalTabLayoutState();


}

class _HorizontalTabLayoutState extends State<HorizontalTabLayout> with SingleTickerProviderStateMixin {

  int selectedTabIndex = 0;
  @override
  AnimationController _controller;
  Animation<Offset> _animation;
  Animation<double> _fadeAnimation;


  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    _animation = Tween<Offset>(begin: Offset(0,0), end: Offset(0,-0.01)).animate(_controller);
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
  }

  playAnimation() {
    _controller.reset();
    _controller.forward();
  }


  @override
  Widget build(BuildContext context){
    double button_space = MediaQuery.of(context).size.width*0.04;

    return Container(
        height:  MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,

        child: Stack(
            children: <Widget>[
              Positioned(
                bottom: 0,
                width: (MediaQuery.of(context).size.width),
                height: 70.0,
                child: Padding(
                  padding: const EdgeInsets.only(left: 0.0, right: 0.0, top: 5.0, bottom: 0.0),
                  child: Container(
                    decoration: new BoxDecoration(
                      color: Color(0xFF070b16),// Colors.white, //background color of box
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4.0, // soften the shadow
                          spreadRadius: 1.0, //extend the shadow
                          offset: Offset(
                            0.0, // Move to right 10  horizontally
                            0.0, // Move to bottom 10 Vertically
                          ),
                        )
                      ],
                    ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      TabText(
                        text: "Award",
                        isSelected: selectedTabIndex == 0,
                        onTabTap: (){
                          onTabTap(0);
                          // globals.isSelected = 0;
                        },
                        iconTab: Icons.card_giftcard,
                      ),
                      SizedBox(width: button_space),
                      TabText(
                        text: "Transfer",
                        isSelected: selectedTabIndex == 1,
                        onTabTap: (){
                          onTabTap(1);
                          //globals.isSelected = 1;
                        },
                        iconTab: Icons.arrow_circle_up_outlined,
                      ),
                      SizedBox(width: button_space),
                      TabText(
                        text: "Receive",
                        isSelected: selectedTabIndex == 2,
                        onTabTap: (){
                          onTabTap(2);
                          //globals.isSelected = 2;
                        },
                        iconTab: Icons.arrow_circle_down_outlined,
                      ),
                      SizedBox(width: button_space),
                      TabText(
                        text: "News",
                        isSelected: selectedTabIndex == 3,
                        onTabTap: (){
                          onTabTap(3);
                          //globals.isSelected = 3;
                        },
                        iconTab: Icons.event_note_outlined,
                      ),
                      SizedBox(width:button_space),
                      TabText(
                        text: "Settings",
                        isSelected: selectedTabIndex == 4,
                        onTabTap: (){
                          onTabTap(4);
                          //globals.isSelected =4;
                        },
                        iconTab: Icons.settings_outlined,
                      ),
                    ],
                  ),)
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 2.0, bottom: 60.0),
                  child: FutureBuilder(
                      future: playAnimation(),
                      builder: (context, snapshot) {
                        return FadeTransition(
                            opacity: _fadeAnimation,
                            child: SlideTransition(
                              position: _animation,
                              child: ListView(
                                scrollDirection: Axis.vertical,
                                children: getList(selectedTabIndex),
                              ),
                            )
                        );
                      }
                  )
              )
            ]
        )


    );

  }

  List<Widget> getList(index){
    return[
      [
        AwardPage(), // TrainingPage(),
      ],
      [
        TransferPage(), //  Content(),
      ],
      [
        ReceivePage(),   // ProgressPage(),
        //TrainingCard(training: morningTraining),
      ],
      [
        NewsPage(), //   ProfilePage(),
      ],
      [
        SettingsPage(), //   ProfilePage(),
      ]
    ][index];
  }

  onTabTap(int index) {
    setState((){
      selectedTabIndex = index;
      //globals.isSelected = index;
    });
  }
}



