

import 'package:daily_quotes/floor_db/favorite.dart';
import 'package:firebase_auth/firebase_auth.dart';

class QuotesRepository {

  static final QuotesRepository _singleton = QuotesRepository._internal();

  QuotesRepository._internal();

  factory QuotesRepository() {
    return _singleton;

  }

  late  List<FavoriteModel> favorites = [];
  late User user;

}