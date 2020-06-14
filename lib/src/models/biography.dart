
class Biography {
  String fullName;
  String alterEgos;
  List<String> aliases;
  String placeOfBirth;
  String firstAppearance;
  String publisher;
  String alignment;

  Biography(
      {this.fullName,
      this.alterEgos,
      this.aliases,
      this.placeOfBirth,
      this.firstAppearance,
      this.publisher,
      this.alignment});

  Biography.fromJson(Map<String, dynamic> json) {
    fullName = json['full-name'];
    alterEgos = json['alter-egos'];
    aliases = json['aliases'].cast<String>();
    placeOfBirth = json['place-of-birth'];
    firstAppearance = json['first-appearance'];
    publisher = json['publisher'];
    alignment = json['alignment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['full-name'] = this.fullName;
    data['alter-egos'] = this.alterEgos;
    data['aliases'] = this.aliases;
    data['place-of-birth'] = this.placeOfBirth;
    data['first-appearance'] = this.firstAppearance;
    data['publisher'] = this.publisher;
    data['alignment'] = this.alignment;
    return data;
  }
}
