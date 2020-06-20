
class Hero {
  int id=0;
  String name="";
  String hp="";
  String damage="";
  String defense="";
  String title="";

  Hero({this.id, this.name, this.hp, this.damage, this.defense, this.title});

  factory Hero.fromJsonMap(Map<String, dynamic> jsonMap){
    return (Hero(
    name: jsonMap["Name"],
    hp: jsonMap["Hp"],
    damage: jsonMap["Damage"],
    defense: jsonMap["Defense"],
    title: jsonMap["Title"],
    ));
  }
}