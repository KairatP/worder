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

// import 'dart:convert';

// HistoryRhymesModel historyFromMap(String str) => HistoryRhymesModel.fromJson(json.decode(str));

// String toHistoryMap(HistoryRhymesModel data) => json.encode(data.toJson());


// class HistoryRhymesModel {
//   const HistoryRhymesModel({required this.word, required this.rhymes});

//   final String word;
//   final RhymesModel rhymes;

//   factory HistoryRhymesModel.fromJson(Map<String, dynamic> json) =>
//       HistoryRhymesModel(word: json['word'], rhymes: json['rhymes']);

//   Map<String, dynamic> toJson() => {
//         'word': word,
//         'rhymes': rhymes,
//       };
// }


// class HistoryRhymesModel {
//   const HistoryRhymesModel({required this.word, required this.rhymes});

//   final String word;
//   final List<String> rhymes;

//   factory HistoryRhymesModel.fromJson(Map<String, dynamic> json) =>
//       HistoryRhymesModel(
//         word: json['word'],
//         rhymes: List<String>.from(json['rhymes']),
//       );

//   Map<String, dynamic> toJson() => {
//         'word': word,
//         'rhymes': rhymes,
//       };
// }


// import 'package:worder/api/models/rhymes_model.dart';

// // class HistoryRhymesModel {
// //   const HistoryRhymesModel({required this.word, required this.rhymes});

// //   final String word;
// //   final RhymesModel rhymes;

// //   factory HistoryRhymesModel.fromJson(Map<String, dynamic> json) =>
// //       HistoryRhymesModel(word: json['word'], rhymes: RhymesModel.fromJson(json['rhymes']));

// //   Map<String, dynamic> toJson() => {
// //         'word': word,
// //         'rhymes': rhymes.toJson(),
// //       };
// // }

// class HistoryRhymesModel {
//   const HistoryRhymesModel(this.data);

//   final Map<String, RhymesModel> data;

//   // Convert data to JSON
//   Map<String, dynamic> toJson() => {'data': data};

//   // Create model from JSON
//   factory HistoryRhymesModel.fromJson(Map<String, dynamic> json) {
//     // Convert the dynamic values to RhymesModel instances
//     final Map<String, dynamic> jsonData = json['data'];
//     final Map<String, RhymesModel> rhymesData = {};
//     jsonData.forEach((key, value) {
//       rhymesData[key] = RhymesModel.fromJson(value);
//     });
//     return HistoryRhymesModel(rhymesData);
//   }
// }
