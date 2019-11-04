class ProjectModel {
  final String name, description;

  ProjectModel({
    this.name,
    this.description
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return new ProjectModel(
      name: json['name'],
      description: json['description']
    );
  }
}