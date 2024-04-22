// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_rhymes_model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class HistoryRhymesModel extends _HistoryRhymesModel
    with RealmEntity, RealmObjectBase, RealmObject {
  HistoryRhymesModel(
    String id,
    String word, {
    Iterable<String> words = const [],
    Iterable<bool> isFavorite = const [],
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'word', word);
    RealmObjectBase.set<RealmList<String>>(
        this, 'words', RealmList<String>(words));
    RealmObjectBase.set<RealmList<bool>>(
        this, 'isFavorite', RealmList<bool>(isFavorite));
  }

  HistoryRhymesModel._();

  @override
  String get id => RealmObjectBase.get<String>(this, 'id') as String;
  @override
  set id(String value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get word => RealmObjectBase.get<String>(this, 'word') as String;
  @override
  set word(String value) => RealmObjectBase.set(this, 'word', value);

  @override
  RealmList<String> get words =>
      RealmObjectBase.get<String>(this, 'words') as RealmList<String>;
  @override
  set words(covariant RealmList<String> value) =>
      throw RealmUnsupportedSetError();

  @override
  RealmList<bool> get isFavorite =>
      RealmObjectBase.get<bool>(this, 'isFavorite') as RealmList<bool>;
  @override
  set isFavorite(covariant RealmList<bool> value) =>
      throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<HistoryRhymesModel>> get changes =>
      RealmObjectBase.getChanges<HistoryRhymesModel>(this);

  @override
  HistoryRhymesModel freeze() =>
      RealmObjectBase.freezeObject<HistoryRhymesModel>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(HistoryRhymesModel._);
    return const SchemaObject(
        ObjectType.realmObject, HistoryRhymesModel, 'HistoryRhymesModel', [
      SchemaProperty('id', RealmPropertyType.string, primaryKey: true),
      SchemaProperty('word', RealmPropertyType.string),
      SchemaProperty('words', RealmPropertyType.string,
          collectionType: RealmCollectionType.list),
      SchemaProperty('isFavorite', RealmPropertyType.bool,
          collectionType: RealmCollectionType.list),
    ]);
  }
}
