class Appearance {
  String gender;
  String race;
  List<String> height;
  List<String> weight;
  String eyeColor;
  String hairColor;

  Appearance({
    this.gender,
    this.race,
    this.height,
    this.weight,
    this.eyeColor,
    this.hairColor,
  });

  Appearance.fromJson(Map<String, dynamic> json) {
    gender = json['gender'];
    race = json['race'];
    height = json['height'].cast<String>();
    weight = json['weight'].cast<String>();
    eyeColor = json['eye-color'];
    hairColor = json['hair-color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['gender'] = this.gender;
    data['race'] = this.race;
    data['height'] = this.height;
    data['weight'] = this.weight;
    data['eye-color'] = this.eyeColor;
    data['hair-color'] = this.hairColor;
    return data;
  }
}
