class Powerstats {
  String intelligence;
  String strength;
  String speed;
  String durability;
  String power;
  String combat;

  Powerstats({
    this.intelligence,
    this.strength,
    this.speed,
    this.durability,
    this.power,
    this.combat,
  });

  Powerstats.fromJson(Map<String, dynamic> json) {
    intelligence = json['intelligence'];
    strength = json['strength'];
    speed = json['speed'];
    durability = json['durability'];
    power = json['power'];
    combat = json['combat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['intelligence'] = this.intelligence;
    data['strength'] = this.strength;
    data['speed'] = this.speed;
    data['durability'] = this.durability;
    data['power'] = this.power;
    data['combat'] = this.combat;
    return data;
  }
}
