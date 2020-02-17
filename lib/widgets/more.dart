import 'package:daily_food/utils/config.dart';
import 'package:flutter/material.dart';

class MoreXD extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.safeBlockHorizontal * 42,
      height: SizeConfig.safeBlockVertical * 30,
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
              'img/bell1.png',
              width: SizeConfig.safeBlockHorizontal * 20.4,
              height: SizeConfig.safeBlockVertical * 10,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: SizeConfig.safeBlockVertical * 2.4,),
          Text(
            'More',
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
            'Taxi, Guide,',
            style: TextStyle(
                color: Colors.grey[800],
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                letterSpacing: 0.2,
                wordSpacing: 2,
                fontSize: SizeConfig.safeBlockHorizontal * 3.2
            ),
          ),
          Text(
            'Transfer, etc.',
            style: TextStyle(
                color: Colors.grey[800],
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                letterSpacing: 0.2,
                wordSpacing: 2,
                fontSize: SizeConfig.safeBlockHorizontal * 3.2
            ),
          ),

          SizedBox(height: SizeConfig.safeBlockVertical * 3,),
          Text(
            'new',
            style: TextStyle(
                color: Colors.grey[800],
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
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