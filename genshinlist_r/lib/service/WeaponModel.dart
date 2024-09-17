class Weapon {
  final String name;
  final String type;
  final int rarity;
  final int baseAttack;
  final String subStat;
  final String passiveName;
  final String passiveDesc;

  Weapon({
    required this.name,
    required this.type,
    required this.rarity,
    required this.baseAttack,
    required this.subStat,
    required this.passiveName,
    required this.passiveDesc,
  });

  factory Weapon.fromJson(Map<String, dynamic> json) {
    return Weapon(
      name: json['name'],
      type: json['type'],
      rarity: json['rarity'],
      baseAttack: json['baseAttack'],
      subStat: json['subStat'],
      passiveName: json['passiveName'],
      passiveDesc: json['passiveDesc'],
    );
  }
  get id => null;
}