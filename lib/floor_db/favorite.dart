
import 'package:floor/floor.dart';

@Entity(tableName: 'favorites')
class FavoriteModel {
  FavoriteModel({

    this.id,
    required this.author,
    required this.quote,
    required this.submitby,
  });

  int? id;
  late final String author;
  @primaryKey
  late final String quote;
  late final String submitby;

  FavoriteModel.fromJson(Map<String, dynamic> json){
    author = json['author'];
    quote = json['quote'];
    submitby = json['submitby'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['author'] = author;
    _data['quote'] = quote;
    _data['submitby'] = submitby;
    return _data;
  }
}