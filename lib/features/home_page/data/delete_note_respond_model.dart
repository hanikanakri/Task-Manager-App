import '/core/api/core_models/base_result_model.dart';

class DeleteNoteRespondModel extends BaseResultModel {
  int? id;
  String? todo;
  bool? completed;
  int? userId;
  bool? isDeleted;
  DateTime? deletedOn;

  DeleteNoteRespondModel({
    this.id,
    this.todo,
    this.completed,
    this.userId,
    this.isDeleted,
    this.deletedOn,
  });

  factory DeleteNoteRespondModel.fromJson(Map<String, dynamic> json) =>
      DeleteNoteRespondModel(
        id: json["id"],
        todo: json["todo"],
        completed: json["completed"],
        userId: json["userId"],
        isDeleted: json["isDeleted"],
        deletedOn: json["deletedOn"] == null
            ? null
            : DateTime.parse(json["deletedOn"]),
      );

  @override
  Map<String, dynamic> toJson() => {
        "id": id,
        "todo": todo,
        "completed": completed,
        "userId": userId,
        "isDeleted": isDeleted,
        "deletedOn": deletedOn?.toIso8601String(),
      };
}
