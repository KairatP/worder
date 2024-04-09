import 'package:worder/repository/model/history_rhymes_model.dart';

abstract class DbHelperInterface {
  Future<List<HistoryRhymesModel>> getRhymesList();
  Future<HistoryRhymesModel?> getRhyme(String word);
  Future<void> setRhyme(HistoryRhymesModel rhymes);
  Future<void> clear();
  Future<List<HistoryRhymesModel>> getFavoriteRhymesList();
  Future<HistoryRhymesModel?> getUpdateFavoriteRhymesList(
      String word, String rhyme, bool isFavorite);
  Future<List<HistoryRhymesModel>> getUpdatedRhymesList(String word, String rhyme, bool isFavorite);
}
