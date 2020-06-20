import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:super_hero/model/Hero.dart' as heroModel;

class RowItem extends StatelessWidget {

  heroModel.Hero hero;
  RowItem(this.hero, Function(int id) deleteHero);
  Function deleteHero;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0)),
          elevation: 5,
          margin: EdgeInsets.all(16.0),
          child: Container(
              width: 400,
              height: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(10.0)),
                    elevation: 5,
                    child: Container(
                      width: 120,
                      height: 120,
                      margin: EdgeInsets.all(3.0),
                      child: Column(
                        mainAxisAlignment:
                        MainAxisAlignment.center,
                        crossAxisAlignment:
                        CrossAxisAlignment.center,
                        children: <Widget>[
                          Image(
                              image: AssetImage(
                                  'assets/images/saitama.jpg'))
                        ],
                      ),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(10.0)),
                    elevation: 5,
                    child: Container(
                      width: 220,
                      height: 120,
                      margin: EdgeInsets.all(3.0),
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment:
                            MainAxisAlignment.center,
                            crossAxisAlignment:
                            CrossAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.accessibility,
                                    color: Colors.blue,
                                    size: 20,
                                  ),
                                  Text(hero.name),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.opacity,
                                    color: Colors.blue,
                                    size: 20,
                                  ),
                                  Text(hero.hp),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.pets,
                                    color: Colors.blue,
                                    size: 20,
                                  ),
                                  Text(hero.damage),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.security,
                                    color: Colors.blue,
                                    size: 20,
                                  ),
                                  Text(hero.defense),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.mode_edit,
                                    color: Colors.blue,
                                    size: 20,
                                  ),
                                  Text(hero.title),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.all(20.0),
//                            alignment: Alignment(0.0,0.0),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(
                                      10.0)),
                              elevation: 5,
                              color: Colors.red,
                              child: IconButton(
                                  onPressed: () {
                                    deleteHero(hero.id);
                                  },
                                  icon: Icon(
                                    Icons.cancel,
                                    color: Colors.white,
                                  )),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ],
    );
  }
}

//Container(
//child: Card(
//child: Column(
//children: <Widget>[
//Container(
//child: Text(hero.name),
//),
//Container(
//child: IconButton(
//onPressed: deleteHero,
//icon: Icon(Icons.cancel),
//color: Colors.lightBlue,
//),
//),
//],
//),
//),
//);
