class Connections {
  String groupAffiliation;
  String relatives;

  Connections({this.groupAffiliation, this.relatives});

  Connections.fromJson(Map<String, dynamic> json) {
    groupAffiliation = json['group-affiliation'];
    relatives = json['relatives'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['group-affiliation'] = this.groupAffiliation;
    data['relatives'] = this.relatives;
    return data;
  }
}
