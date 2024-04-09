import 'package:realm/realm.dart';
import 'package:worder/repository/db_helper_interface.dart';
import 'package:worder/repository/model/history_rhymes_model.dart';

class DbHelper implements DbHelperInterface {
  DbHelper() {
    config = Configuration.local([HistoryRhymesModel.schema]);
    realm = Realm(config);
  }

  late Configuration config;
  late Realm realm;

  @override
  Future<List<HistoryRhymesModel>> getRhymesList() async {
    return realm.all<HistoryRhymesModel>().toList();
  }

  @override
  Future<HistoryRhymesModel?> getRhyme(String word) async {
    // Query for the first HistoryRhymesModel with the given word
    var results = realm.all<HistoryRhymesModel>().query("word == '$word'");
    // Return the first result if available, otherwise return null
    return results.isNotEmpty ? results.first : null;
  }

  @override
  Future<void> setRhyme(HistoryRhymesModel rhymes) async {
    realm.write(() => realm.add<HistoryRhymesModel>(rhymes));
  }

  @override
  Future<void> clear() async {
    realm.write(() => realm.deleteAll<HistoryRhymesModel>());
  }

  // @override
  // Future<List<HistoryRhymesModel>> getFavoriteRhymesList() async {
  //   // Find the HistoryRhymesModel object with true isFavorite value
  //   final result = realm.all<HistoryRhymesModel>().toList();
  //   final favoriteRhymes =
  //       result.where((rhyme) => rhyme.isFavorite.isValid == true).toList();
  //   // Return the only true isFavorite list of HistoryRhymesModel objects
  //   return favoriteRhymes;
  // }

  @override
  Future<List<HistoryRhymesModel>> getFavoriteRhymesList() async {
    // Find the HistoryRhymesModel objects with true isFavorite value
    final result = realm.all<HistoryRhymesModel>().toList();
    final favoriteRhymes = result
      .where((item) => item.isFavorite.any((isFav) => isFav))
      .toList();
     // Return the only true isFavorite list of HistoryRhymesModel objects
    return favoriteRhymes;
  }

  @override
  Future<HistoryRhymesModel?> getUpdateFavoriteRhymesList(
      String word, String rhyme, bool isFavorite) async {
    final result =
        realm.all<HistoryRhymesModel>().query('word == "$word"').first;

    realm.write(() {
      final index = result.words.indexOf(rhyme);
      if (index >= 0 && index < result.isFavorite.length) {
        result.isFavorite[index] = isFavorite;
      }
    });

    var resultUpdat =
        realm.all<HistoryRhymesModel>().query('word == "$word"');
    return resultUpdat.isNotEmpty ? resultUpdat.first : null;
  }

  @override
  Future<List<HistoryRhymesModel>> getUpdatedRhymesList(
    String word, String rhyme, bool isFavorite) async {

    final favoriteUpdate = realm.all<HistoryRhymesModel>().query('word == "$word"').first;

    realm.write(() {
      final index = favoriteUpdate.words.indexOf(rhyme);
      if (index >= 0 && index < favoriteUpdate.isFavorite.length) {
        favoriteUpdate.isFavorite[index] = isFavorite;
      }
    });

    // Find the HistoryRhymesModel object with true isFavorite value
    final result = realm.all<HistoryRhymesModel>().toList();
    final favoriteRhymes =
        result.where((rhyme) => rhyme.isFavorite.isValid == true).toList();
    // Return the only true isFavorite list of HistoryRhymesModel objects
    return favoriteRhymes;
  }
}


