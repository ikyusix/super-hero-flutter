import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:super_hero/model/Hero.dart' as heroModel;
import 'package:super_hero/service/HeroServiceAPI.dart';

class HeroMainScreen extends StatefulWidget {
  @override
  State createState() {
    return HeroMainScreenState();
  }
}

class HeroMainScreenState extends State {
  var idTextEditingCtrl = TextEditingController();
  heroModel.Hero hero;
  var heroServiceAPI = HeroServiceAPI();

  Future fetchHeroById() async {
    var id = idTextEditingCtrl.text;
    heroServiceAPI.fetchHeroById(id).then((hero) {
      setState(() {
        this.hero = hero;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("One Punch Man"),
          ),
          body: Column(
            children: <Widget>[
              Card(
                elevation: 5,
                margin: EdgeInsets.all(16.0),
                child: Row(
                  children: <Widget>[
                    Flexible(
                      child: TextField(
                        decoration: InputDecoration(hintText: "ID Hero"),
                        controller: idTextEditingCtrl,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.keyboard_arrow_right),
                      onPressed: fetchHeroById,
                    )
                  ],
                ),
              ),
              Card(
                  margin: EdgeInsets.all(16.0),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0)),
                  child: Container(
                      margin: EdgeInsets.all(16.0),
                      child: Column(
                        children: <Widget>[
                          Text(hero == null ? "" : hero.name),
                        ],
                      )
                  )
              ),
              RaisedButton(
                child: Text("Get All Heroes"),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100.0)),
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: () {
                  Navigator.pushNamed(context, "/hero");
                },
              ),
            ],
          ),
        ));
  }
}
