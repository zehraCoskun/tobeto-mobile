class TeamModel {
  final String title;
  final String name;
  final String imageUrl;

  TeamModel({
    required this.title,
    required this.name,
    required this.imageUrl,
  });

  factory TeamModel.fromMap(Map<String, dynamic> map) {
    return TeamModel(
      title: map["title"] as String,
      name: map["name"] as String,
      imageUrl: map["image_url"] as String,
    );
  }
}
