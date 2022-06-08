import 'dart:async';

import 'package:daily_quotes/floor_db/favorite.dart';
import 'package:daily_quotes/floor_db/favorite_dao.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
part 'database.g.dart';

@Database(version: 1, entities: [FavoriteModel])
abstract class AppDatabase extends FloorDatabase {

  FavoriteDAO get favoritesDAO;

}