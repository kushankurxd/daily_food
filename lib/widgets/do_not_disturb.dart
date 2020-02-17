import 'package:daily_food/utils/config.dart';
import 'package:flutter/material.dart';

class DoNotDisturbXD extends StatefulWidget{

  @override
  _DoNotDisturbXDState createState() => _DoNotDisturbXDState();
}

class _DoNotDisturbXDState extends State<DoNotDisturbXD> {

  bool _state = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.safeBlockHorizontal * 42,
      height: SizeConfig.safeBlockVertical * 24,
      decoration: BoxDecoration(
          color: Colors.grey[300].withOpacity(0.4),
          borderRadius: BorderRadius.circular(SizeConfig.safeBlockHorizontal * 9.4)
      ),
      child: Column(
        children: <Widget>[
          SizedBox(height: SizeConfig.safeBlockVertical * 4.4,),
          Transform.scale(
            scale: 1.4,
            child: Switch(
              value: _state,
              onChanged: (val){
                setState(() {
                  _state = val;
                });
              },
              activeTrackColor: Colors.grey[800],
              activeColor: Colors.white,
              inactiveThumbColor: Colors.grey[800],
              inactiveTrackColor: Colors.grey[300],
            ),
          ),
          SizedBox(height: SizeConfig.safeBlockVertical * 4,),
          Text(
            'Do Not',
            style: TextStyle(
                color: Colors.grey[900],
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                letterSpacing: 0.2,
                fontSize: SizeConfig.safeBlockHorizontal * 4
            ),
          ),
          SizedBox(height: SizeConfig.safeBlockVertical * 0.5,),
          Text(
            'Disturb',
            style: TextStyle(
                color: Colors.grey[900],
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                letterSpacing: 0.2,
                fontSize: SizeConfig.safeBlockHorizontal * 4
            ),
          ),
        ],
      ),
    );
  }
}