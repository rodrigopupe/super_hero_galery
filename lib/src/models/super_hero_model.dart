import 'appearance.dart';
import 'biography.dart';
import 'connections.dart';
import 'image.dart';
import 'powerstats.dart';
import 'work.dart';

class SuperHeroModel {
  String response;
  String id;
  String name;
  Powerstats powerstats;
  Biography biography;
  Appearance appearance;
  Work work;
  Connections connections;
  Image image;

  SuperHeroModel(
      {this.response,
      this.id,
      this.name,
      this.powerstats,
      this.biography,
      this.appearance,
      this.work,
      this.connections,
      this.image});

  SuperHeroModel.fromJson(Map<String, dynamic> json) {
    response = json['response'];
    id = json['id'];
    name = json['name'];
    powerstats = json['powerstats'] != null ? Powerstats.fromJson(json['powerstats']) : null;
    biography = json['biography'] != null ? Biography.fromJson(json['biography']) : null;
    appearance = json['appearance'] != null ? Appearance.fromJson(json['appearance']) : null;
    work = json['work'] != null ? Work.fromJson(json['work']) : null;
    connections = json['connections'] != null ? Connections.fromJson(json['connections']) : null;
    image = json['image'] != null ? Image.fromJson(json['image']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['response'] = this.response;
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.powerstats != null) {
      data['powerstats'] = this.powerstats.toJson();
    }
    if (this.biography != null) {
      data['biography'] = this.biography.toJson();
    }
    if (this.appearance != null) {
      data['appearance'] = this.appearance.toJson();
    }
    if (this.work != null) {
      data['work'] = this.work.toJson();
    }
    if (this.connections != null) {
      data['connections'] = this.connections.toJson();
    }
    if (this.image != null) {
      data['image'] = this.image.toJson();
    }
    return data;
  }

  String getFieldOrDefaultValue(String field, String defaultValue) {
    if (field == 'null' || field.isEmpty || field.trim() == '-') {
      return defaultValue;
    }

    return field;
  }
}
