import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:super_hero/model/Hero.dart' as heroModel;
import 'package:super_hero/service/HeroServiceAPI.dart';
import 'package:super_hero/shared/RowItem.dart';

class HeroListScreen extends StatefulWidget {
  @override
  State createState() {
    return HeroListScreenState();
  }
}

class HeroListScreenState extends State {
  var idTextEditingCtrl = TextEditingController();
  heroModel.Hero hero;
  var heroServiceAPI = HeroServiceAPI();
  List<heroModel.Hero> listHeroes;

  @override
  void initState() {
    getAllHeroes();
  }

  getAllHeroes() {
    heroServiceAPI.fetchAllHero().then((hero) {
      setState(() {
        this.listHeroes = hero;
      });
    });
  }

  deleteHero(int id) {
    heroServiceAPI.DeleteHero(id).then((hero) {
      setState(() {
        this.listHeroes.removeAt(id);
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
          Expanded(
            child: ListView.builder(
                itemCount: listHeroes == null ? 0 : listHeroes.length,
                itemBuilder: (BuildContext context, id) {
                  return RowItem();
                }),
          ),
//                RaisedButton(
//                  child: Text(""),
//                  shape: RoundedRectangleBorder(
//                      borderRadius: BorderRadius.circular(100.0)),
//                  color: Colors.blue,
//                  textColor: Colors.white,
//                  onPressed: getAllHeroes,
//                ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    ));
  }
}
