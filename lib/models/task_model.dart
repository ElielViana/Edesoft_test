class TaskModel {
  late String id;
  late String name;
  late DateTime createAt;

  TaskModel({required this.name, required this.createAt, required this.id});

  TaskModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createAt = DateTime.tryParse(json['createdAt'])!;
  }
}
