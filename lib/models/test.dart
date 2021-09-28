
class Test {
  int userId;
  int id;
  String title;
  bool completed;

  Test({this.userId, this.id, this.title, this.completed});

  Test.fromJson(Map<String, dynamic> json) {
    if(json["userId"] is int)
      this.userId = json["userId"];
    if(json["id"] is int)
      this.id = json["id"];
    if(json["title"] is String)
      this.title = json["title"];
    if(json["completed"] is bool)
      this.completed = json["completed"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["userId"] = this.userId;
    data["id"] = this.id;
    data["title"] = this.title;
    data["completed"] = this.completed;
    return data;
  }
}