class Character {
  final String name;
  final String title;
  final String vision;
  final String weapon;
  final String gender;
  final String nation;
  final String affiliation;
  final int rarity;
  final String release;
  final String constellation;
  final String birthday;
  final String description;

  Character({
    required this.name,
    required this.title,
    required this.vision,
    required this.weapon,
    required this.gender,
    required this.nation,
    required this.affiliation,
    required this.rarity,
    required this.release,
    required this.constellation,
    required this.birthday,
    required this.description,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      name: json['name'],
      title: json['title'],
      vision: json['vision'],
      weapon: json['weapon'],
      gender: json['gender'],
      nation: json['nation'],
      affiliation: json['affiliation'],
      rarity: json['rarity'],
      release: json['release'],
      constellation: json['constellation'],
      birthday: json['birthday'],
      description: json['description'],
    );
  }

  get id => null;
}
