// --- DATA MODELS ---
class Experience {
  final String role;
  final String company;
  final String duration;
  final String description;

  Experience({
    required this.role,
    required this.company,
    required this.duration,
    required this.description,
  });
}


class Project {
  final String name;
  final String company;
  final String description;
  final String technologies;
  final List<String> responsibilities;

  Project({
    required this.name,
    required this.company,
    required this.description,
    required this.technologies,
    required this.responsibilities,
  });
}

class Certification {
  final String name;
  final String date;
  final String skills;
  final String link;

  Certification({
    required this.name,
    required this.date,
    required this.skills,
    required this.link,
  });
}