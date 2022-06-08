

import 'package:daily_quotes/floor_db/favorite.dart';
import 'package:floor/floor.dart';

@dao
abstract class FavoriteDAO {

  @Query('SELECT * FROM favorites')
  Future<List<FavoriteModel>> getAllFavorites();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertAllFavorites(List<FavoriteModel> list);


  @delete
  Future<void> deleteFromFavorite(FavoriteModel favoriteModel);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertFavorite(FavoriteModel favoriteModel);
  

}