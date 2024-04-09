// import 'package:json_annotation/json_annotation.dart';
// import 'package:realm/realm.dart';
// import 'package:worder/repositorys/model/history_rhymes.dart';

// part 'rhymes_model.g.dart';

// @JsonSerializable()
// class RhymesModel {
//   const RhymesModel({required this.rhymes});

//   final List<String> rhymes;

//   factory RhymesModel.fromJson(List<dynamic> json) =>
//       _$RhymesModelFromJson(json);

//   List<dynamic> toJson() => _$RhymesModelToJson(this);

//   /// add to&from entity method
//   HistoryRhymesModel toLocalHistory(String queryWord) =>
//       HistoryRhymesModel(queryWord, Uuid.v4().toString(), rhymes: rhymes);
// }




/// Alternative way to save local data and use Models

// class RhymesModel {
//   RhymesModel({required this.rhymes});
//   final List<String> rhymes;

//   factory RhymesModel.fromJson(List<dynamic> json) {
//     return RhymesModel(rhymes: List<String>.from(json));
//   }
//   Map<String, dynamic> toJson() {
//     return {'rhymes': rhymes};
//   }

//   factory RhymesModel.fromJsonMap(Map<String, dynamic> map) {
//     return RhymesModel(rhymes: List<String>.from(map['rhymes']));
//   }
// }


// class RhymesModel {
//   RhymesModel({required this.rhymes});

//   final List<String> rhymes;

//   factory RhymesModel.fromJson(List<dynamic> json) {
//     return RhymesModel(rhymes: List<String>.from(json));
//   }

//   Map<String, dynamic> toJson() {
//     return {'rhymes': rhymes};
//   }

//   factory RhymesModel.fromJsonMap(Map<String, dynamic> map) {
//     return RhymesModel(rhymes: List<String>.from(map['rhymes']));
//   }
// }


class RhymesModel {
  RhymesModel({required this.rhymes});

  final List<String> rhymes;

  factory RhymesModel.fromJson(List<dynamic> json) {
    return RhymesModel(rhymes: List<String>.from(json));
  }

  List<dynamic> toJson() {
    return rhymes.toList();
  }
}