import 'dart:math';

import 'package:daily_food/utils/config.dart';
import 'package:daily_food/utils/helper.dart';
import 'package:daily_food/widgets/filter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Screen1XD extends StatefulWidget {
  @override
  State createState() {
    return _Screen1XDState();
  }
}

class _Screen1XDState extends State<Screen1XD> {
  List _titles = ['Food', 'Domestic', 'Entertainment', 'Contact'];
  List _items = [
    new FoodItem('Chicken Burger', '15 min', 'Burger', '25', 'img/hamburger.png'),
    new FoodItem('Icecream', '2 min', 'Dessert', '20', 'img/icecream.png'),
    new FoodItem('Cookies', '25 min', 'Starter', '10', 'img/cookie.png'),
    new FoodItem('Bread Toast', '10 min', 'Breakfast', '5', 'img/breakfast.png')
  ];
  List _cart = [];
  int _selected = 0;
  int _price = 0;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.safeBlockHorizontal * 6.4),
            child: Column(
              children: <Widget>[
                //AppBar
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 6.4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                        child: Icon(
                          Icons.keyboard_backspace,
                          color: Colors.grey[800],
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        }),
                    Text(
                      'Room Service',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Poppins',
                          fontSize: SizeConfig.safeBlockHorizontal * 4.2,
                          letterSpacing: 0.2,
                          wordSpacing: 1.4,
                          fontWeight: FontWeight.w500),
                    ),
                    FilterXD(Colors.grey[900], Colors.grey[800]),
                  ],
                ),

                //Title
                Padding(
                  padding: EdgeInsets.only(
                    top: SizeConfig.safeBlockVertical * 5,
                  ),
                  child: SizedBox(
                    width: SizeConfig.screenWidth,
                    height: SizeConfig.safeBlockVertical * 4,
                    child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: _titles.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              if (_selected != index) {
                                setState(() {
                                  _items = _items..shuffle();
                                });
                              }
                              setState(() {
                                _selected = index;
                              });
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      SizeConfig.safeBlockHorizontal * 4.4),
                              child: Text(
                                '${_titles[index]}',
                                style: TextStyle(
                                  fontSize: index == _selected
                                      ? SizeConfig.safeBlockHorizontal * 3.6
                                      : SizeConfig.safeBlockHorizontal * 3.4,
                                  fontWeight: index == _selected
                                      ? FontWeight.w700
                                      : FontWeight.w500,
                                  color: index == _selected
                                      ? Colors.black
                                      : Colors.grey[600],
                                  fontFamily: 'Poppins',
                                  letterSpacing: 0.2,
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ),

                Expanded(
                  child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: _items.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(
                              bottom: SizeConfig.safeBlockVertical * 2.4),
                          child: InkWell(
                            onTap: () {
                              addItemCart(index);
                            },
                            splashColor: Colors.grey[300],
                            child: Container(
                              height: SizeConfig.safeBlockVertical * 24,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    SizeConfig.safeBlockHorizontal * 8),
                                color: Colors.grey[400].withOpacity(0.2),
                              ),
                              child: Stack(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal:
                                            SizeConfig.safeBlockHorizontal * 8,
                                        vertical:
                                            SizeConfig.safeBlockVertical * 4),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text(
                                              '${_items[index].name}',
                                              style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600,
                                                  letterSpacing: 0.2,
                                                  wordSpacing: 1,
                                                  fontSize: SizeConfig
                                                          .safeBlockHorizontal *
                                                      4),
                                            ),
                                            Text(
                                              '${_items[index].time}',
                                              style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  color: Colors.black87,
                                                  fontWeight: FontWeight.w500,
                                                  letterSpacing: 0.2,
                                                  wordSpacing: 1,
                                                  fontSize: SizeConfig
                                                          .safeBlockHorizontal *
                                                      3.2),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          '${_items[index].type}',
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              color: Colors.grey[600],
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: 0.2,
                                              wordSpacing: 1,
                                              fontSize: SizeConfig
                                                      .safeBlockHorizontal *
                                                  3.2),
                                        ),
                                        Expanded(
                                          child: Align(
                                              alignment: Alignment.bottomLeft,
                                              child: Text(
                                                '${_items[index].price} \$',
                                                style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    color: Colors.grey[800],
                                                    fontWeight: FontWeight.w700,
                                                    letterSpacing: 0.2,
                                                    wordSpacing: 1,
                                                    fontSize: SizeConfig
                                                            .safeBlockHorizontal *
                                                        3.4),
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: SizeConfig.safeBlockHorizontal *
                                            40.4,
                                        top:
                                            SizeConfig.safeBlockVertical * 8.4),
                                    child: Image.asset(
                                      '${_items[index].image}',
                                      fit: BoxFit.cover,
                                      width:
                                          SizeConfig.safeBlockHorizontal * 34,
                                      height: SizeConfig.safeBlockVertical * 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                )
              ],
            ),
          ),
          AnimatedOpacity(
            opacity: _cart.length > 0 ? 1 : 0,
            duration: Duration(milliseconds: 200),
            child: DraggableScrollableSheet(
              initialChildSize: 0.12,
              maxChildSize: 0.12,
              minChildSize: 0.12,
              builder: (context, scrollController) {
                return SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  controller: scrollController,
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(
                                SizeConfig.safeBlockHorizontal * 14.4),
                            topLeft: Radius.circular(
                                SizeConfig.safeBlockHorizontal * 14.4)),
                      ),
                      height: MediaQuery.of(context).size.height * 0.12,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.safeBlockHorizontal * 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                  top: SizeConfig.safeBlockVertical * 1.4),
                              child: Center(
                                child: Container(
                                  width: 40.4,
                                  height: 3,
                                  decoration: BoxDecoration(
                                      color: Colors.grey[600],
                                      borderRadius: BorderRadius.circular(20)),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  bottom: SizeConfig.safeBlockVertical * 2),
                              child: Row(
                                children: <Widget>[
                                  Transform.rotate(
                                    child: Text(
                                      'Cart',
                                      style: TextStyle(
                                          color: Colors.grey[800],
                                          fontFamily: 'Poppins',
                                          letterSpacing: 0.6,
                                          fontWeight: FontWeight.w700,
                                          fontSize:
                                              SizeConfig.safeBlockHorizontal * 4),
                                    ),
                                    angle: -pi / 180 * 90,
                                  ),
                                  SizedBox(
                                    width: SizeConfig.safeBlockHorizontal * 4,
                                  ),
                                  SizedBox(
                                    width: SizeConfig.safeBlockHorizontal * 54,
                                    height: SizeConfig.safeBlockVertical * 6,
                                    child: ListView.builder(
                                      physics: BouncingScrollPhysics(),
                                      itemCount: _cart.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: (){
                                            removeCartItem(index);
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal:
                                                    SizeConfig.safeBlockHorizontal *
                                                        2.4),
                                            child: Container(
                                                width:
                                                    SizeConfig.safeBlockHorizontal *
                                                        13,
                                                decoration: BoxDecoration(
                                                    color: Colors.grey[300]
                                                        .withOpacity(0.4),
                                                    borderRadius: BorderRadius
                                                        .circular(SizeConfig
                                                                .safeBlockHorizontal *
                                                            8)),
                                                child: Stack(
                                                  children: <Widget>[
                                                    Center(
                                                      child: Image.asset(
                                                        '${_cart[index].image}',
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                        left: SizeConfig
                                                                .safeBlockHorizontal *
                                                            10.4,
                                                      ),
                                                      child: Text(
                                                        '${_cart[index].count}',
                                                        style: TextStyle(
                                                            fontFamily: 'Poppins',
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: SizeConfig
                                                                    .safeBlockHorizontal *
                                                                2.8,
                                                            color:
                                                                Colors.grey[800]),
                                                      ),
                                                    )
                                                  ],
                                                )),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    width: SizeConfig.safeBlockHorizontal * 4,
                                  ),
                                  Text(
                                    '\$ $_price',
                                    style: TextStyle(
                                        color: Colors.grey[900],
                                        fontFamily: 'Poppins',
                                        letterSpacing: 0.6,
                                        fontWeight: FontWeight.w700,
                                        fontSize:
                                            SizeConfig.safeBlockHorizontal * 3.4),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  addItemCart(int index) {
    adjustPrice(int.parse(_items[index].price), true);
    for(int i=0;i<_cart.length;i++){
      if(_cart[i].name == _items[index].name){
        setState(() {
          _cart[i].count = (int.parse(_cart[i].count) + 1).toString();
        });
        return;
      }
    }
    setState(() {
      _cart.add(new CartItem(_items[index].name, '1', _items[index].price, _items[index].image));
    });
  }

  removeCartItem(int index) {
    adjustPrice(int.parse(_cart[index].price), false);
    if((int.parse(_cart[index].count)) > 1){
      setState(() {
        _cart[index].count = (int.parse(_cart[index].count) - 1).toString();
      });
      return;
    }
    setState(() {
      _cart.removeAt(index);
    });
  }

  adjustPrice(int price,bool flag){
    setState(() {
      _price =
          flag ? _price + price : _price - price;
    });

  }
}
