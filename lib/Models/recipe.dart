class Resep {
  final String name;
  final String images;
  final String country;
  final String totalTime;
  final String description;
  final String videourl;
  final String calories; 
  final List<String> instructions;

  Resep({
    required this.name,
    required this.images,
    required this.country,
    required this.totalTime,
    required this.description,
    required this.videourl,
    required this.calories,
    required this.instructions,
  });

  factory Resep.fromJson(dynamic json) {
    List<String> instructions = [];

    if (json['instructions'] != null) {
      var instructionList = json['instructions'] as List?;
      if (instructionList != null) {
        for (var instruction in instructionList) {
          if (instruction != null && instruction['display_text'] != null) {
            instructions.add(instruction['display_text']);
          }
        }
      }
    }

    return Resep(
      name: json['name'] as String,
      images: json['thumbnail_url'] as String,
      country: json['country'] as String,
      totalTime: json['total_time_minutes'] != null
          ? json['total_time_minutes'].toString() + " min "
          : " 30 min ",
      description: json['description'] != null ? json['description'] : " ",
      videourl: json['original_video_url'] != null
          ? json['original_video_url']
          : "noVideo",
      calories:
          json['nutrition'] != null && json['nutrition']['calories'] != null
              ? json['nutrition']['calories'].toString()
              : "0",
      instructions: instructions,
    );
  }

  static List<Resep> resepFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Resep.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Resep(name: $name, images: $images, country: $country, totalTime: $totalTime, description: $description, videourl: $videourl, calories: $calories, instructions: $instructions)';
  }
}
