class Quote {
  String id = "";
  String quote;
  String author;
  String submitby = "";

  Quote(this.quote, this.author, {this.submitby = "", this.id = ""});

  Quote.fromJson(Map<String, dynamic> json)
      : this(json["quote"] as String, json["author"] as String,
            submitby: json["submitby"] as String);

  Map<String, Object?> toJson() {
    return {"quote": quote, "author": author, "submitby": submitby};
  }
}
