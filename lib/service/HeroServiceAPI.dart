
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:super_hero/model/Hero.dart';

class HeroServiceAPI{
  final heroAPIUrl = "http://10.0.2.2:8084/hero/";

  Future<Hero> fetchHeroById(String id) async {
    final response = await http.get(heroAPIUrl + id);
    var jsonMap = json.decode(response.body);
    return Hero.fromJsonMap(jsonMap);
  }

  Future<List<Hero>> fetchAllHero() async {
    final response = await http.get(heroAPIUrl);
    Iterable listJsonMap = json.decode(response.body);
    List<Hero> heroes = listJsonMap.map((element) => Hero.fromJsonMap(element)).toList();
    return heroes;
  }

  Future<Hero> DeleteHero(int id) async {
    final response = await http.delete(heroAPIUrl + id.toString());
    var deletedHero = json.decode(response.body);
    return Hero.fromJsonMap(deletedHero);
  }
}