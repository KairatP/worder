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