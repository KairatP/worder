import 'package:realm/realm.dart';

part 'history_rhymes_model.g.dart';

@RealmModel()
class _HistoryRhymesModel {
  @PrimaryKey()
  late String id;
  late String word;
  late List<String> words;
  late List<bool> isFavorite;
}