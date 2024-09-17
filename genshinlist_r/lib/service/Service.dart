import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:genshinlist_r/service/CharModel.dart';
import 'package:genshinlist_r/service/WeaponModel.dart';

class ApiService {
  final String baseUrl ='https://genshin.jmp.blue';

  Future<List<String>> fetchCharacterList() async {
    final response = await http.get(Uri.parse('$baseUrl/characters'));
    if (response.statusCode == 200) {
      List<String> characterList =
          List<String>.from(json.decode(response.body));
      return characterList;
    } else {
      throw Exception('Coming soon');
    }
  }

  Future<Character> fetchCharacterDetail(String characterId) async {
    final response =
        await http.get(Uri.parse('$baseUrl/characters/$characterId'));
    if (response.statusCode == 200) {
      return Character.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load character details');
    }
  }

    Future<List<String>> fetchWeaponList() async {
    final response = 
    await http.get(Uri.parse('$baseUrl/weapons'));
    if (response.statusCode == 200) {
      List<String> weaponList = List<String>.from(json.decode(response.body));
      return weaponList;
    } else {
      throw Exception('Failed to load weapons');
    }
  }


  Future<Weapon> fetchWeaponDetail(String weaponId) async {
    final response = await http.get(Uri.parse('$baseUrl/weapons/$weaponId'));
    if (response.statusCode == 200) {
      return Weapon.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load weapon details');
    }
  }
}
