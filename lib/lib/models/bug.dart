class Bug{

  String title;
  String description;

  Bug(this.title, this.description);

  Bug.fromJson(Map<String, dynamic> json)
      : this(json["bugtitle"] as String, json["bugdetail"] as String);

  Map<String, Object?> toJson() {
    return {"bugtitle": title, "bugdetail": description};
  }
}