import 'package:daily_food/screens/screen1.dart';
import 'package:daily_food/transition/scale.dart';
import 'package:daily_food/utils/config.dart';
import 'package:daily_food/widgets/menu.dart';
import 'package:daily_food/widgets/d_service.dart';
import 'package:daily_food/widgets/do_not_disturb.dart';
import 'package:daily_food/widgets/head_waiter.dart';
import 'package:daily_food/widgets/more.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeXD extends StatefulWidget {

  @override
  _HomeXDState createState() => _HomeXDState();
}

class _HomeXDState extends State<HomeXD> {


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white, // navigation bar color
      statusBarColor: Colors.white, // status bar color
    ));
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          SizedBox(height: SizeConfig.safeBlockVertical * 6.4,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal * 6.4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                MenuXD(Colors.grey[800],Colors.grey[800]),
                Text(
                    'Hammock Hotels',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Poppins',
                    fontSize: SizeConfig.safeBlockHorizontal * 4.2,
                    letterSpacing: 0.2,
                    wordSpacing: 1.4,
                    fontWeight: FontWeight.w500
                  ),
                ),
                Icon(Icons.person_outline,color: Colors.grey[800],)
              ],
            ),
          ),

          SizedBox(height: SizeConfig.safeBlockVertical * 9.4,),
          Text(
            'Room 146',
            style: TextStyle(
              color: Colors.grey[900],
              fontSize: SizeConfig.safeBlockHorizontal * 8,
              fontWeight: FontWeight.w800,
              fontFamily: 'Poppins',
              letterSpacing: 0.2,
              wordSpacing: 2
            ),
          ),

          SizedBox(
            width: SizeConfig.screenWidth,
            height: SizeConfig.safeBlockVertical * 72,
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: SizeConfig.safeBlockHorizontal * 6,top: SizeConfig.safeBlockVertical * 8),
                  child: GestureDetector(
                      child: DServiceXD(),
                    onTap: (){
                        Navigator.push(context, ScaleRoute(page: Screen1XD()));
                    }
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: SizeConfig.safeBlockHorizontal * 52.4,top: SizeConfig.safeBlockVertical * 4.4),
                  child: DoNotDisturbXD(),
                ),
                Padding(
                  padding: EdgeInsets.only(left: SizeConfig.safeBlockHorizontal * 6,top: SizeConfig.safeBlockVertical * 34.4),
                  child: HeadWaiterXD(),
                ),
                Padding(
                  padding: EdgeInsets.only(left: SizeConfig.safeBlockHorizontal * 52.4,top: SizeConfig.safeBlockVertical * 30.4),
                  child: MoreXD(),
                ),
              ],
            ),
          ),
          Text(
              'Breakfast in 10:32',
            style: TextStyle(
              color: Colors.grey[900],
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              letterSpacing: 0.2,
              wordSpacing: 1,
              fontSize: SizeConfig.safeBlockHorizontal * 4
            ),
          ),
          Text(
            'Check the Menu',
            style: TextStyle(
                color: Colors.grey[800],
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                letterSpacing: 0.2,
                wordSpacing: 1,
                fontSize: SizeConfig.safeBlockHorizontal * 3.2
            ),
          ),
        ],
      ),
    );
  }
}
