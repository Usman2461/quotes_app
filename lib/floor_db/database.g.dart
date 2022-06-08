// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  FavoriteDAO? _favoritesDAOInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `favorites` (`id` INTEGER, `author` TEXT NOT NULL, `quote` TEXT NOT NULL, `submitby` TEXT NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  FavoriteDAO get favoritesDAO {
    return _favoritesDAOInstance ??= _$FavoriteDAO(database, changeListener);
  }
}

class _$FavoriteDAO extends FavoriteDAO {
  _$FavoriteDAO(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _favoriteModelInsertionAdapter = InsertionAdapter(
            database,
            'favorites',
            (FavoriteModel item) => <String, Object?>{
                  'id': item.id,
                  'author': item.author,
                  'quote': item.quote,
                  'submitby': item.submitby
                }),
        _favoriteModelDeletionAdapter = DeletionAdapter(
            database,
            'favorites',
            ['id'],
            (FavoriteModel item) => <String, Object?>{
                  'id': item.id,
                  'author': item.author,
                  'quote': item.quote,
                  'submitby': item.submitby
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<FavoriteModel> _favoriteModelInsertionAdapter;

  final DeletionAdapter<FavoriteModel> _favoriteModelDeletionAdapter;

  @override
  Future<List<FavoriteModel>> getAllFavorites() async {
    return _queryAdapter.queryList('SELECT * FROM favorites',
        mapper: (Map<String, Object?> row) => FavoriteModel(
            id: row['id'] as int?,
            author: row['author'] as String,
            quote: row['quote'] as String,
            submitby: row['submitby'] as String));
  }

  @override
  Future<void> insertAllFavorites(List<FavoriteModel> list) async {
    await _favoriteModelInsertionAdapter.insertList(
        list, OnConflictStrategy.replace);
  }

  @override
  Future<void> insertFavorite(FavoriteModel favoriteModel) async {
    await _favoriteModelInsertionAdapter.insert(
        favoriteModel, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteFromFavorite(FavoriteModel favoriteModel) async {
    await _favoriteModelDeletionAdapter.delete(favoriteModel);
  }
}
