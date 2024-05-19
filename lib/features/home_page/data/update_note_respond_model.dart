import '/core/api/core_models/base_result_model.dart';

class UpdateNoteRespondModel extends BaseResultModel {
  String? id;
  String? todo;
  bool? completed;
  int? userId;

  UpdateNoteRespondModel({
    this.id,
    this.todo,
    this.completed,
    this.userId,
  });

  factory UpdateNoteRespondModel.fromJson(Map<String, dynamic> json) =>
      UpdateNoteRespondModel(
        id: json["id"],
        todo: json["todo"],
        completed: json["completed"],
        userId: json["userId"],
      );

  @override
  Map<String, dynamic> toJson() => {
        "id": id,
        "todo": todo,
        "completed": completed,
        "userId": userId,
      };
}
