class StringScores {
  String stringScore;

  StringScores({this.stringScore});

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();

    map["puan"] = stringScore;

    return map;
  }

  StringScores.fromMap(Map<String, dynamic> map) {
    this.stringScore = map["puan"];
  }
}
