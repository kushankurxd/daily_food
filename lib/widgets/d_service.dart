import 'package:daily_food/utils/config.dart';
import 'package:flutter/material.dart';

class DServiceXD extends StatelessWidget{

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
          SizedBox(height: SizeConfig.safeBlockVertical * 3,),
          ClipRRect(
            borderRadius: BorderRadius.circular(SizeConfig.safeBlockHorizontal * 6.4),
            child: Image.asset(
              'img/food1.png',
              width: SizeConfig.safeBlockHorizontal * 20.4,
              height: SizeConfig.safeBlockVertical * 10,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: SizeConfig.safeBlockVertical * 2.4,),
          Text(
            'R. Service',
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
            'Food & Stuff',
            style: TextStyle(
                color: Colors.grey[800],
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                letterSpacing: 0.2,
                wordSpacing: 2,
                fontSize: SizeConfig.safeBlockHorizontal * 3.2
            ),
          ),
        ],
      ),
    );
  }
}