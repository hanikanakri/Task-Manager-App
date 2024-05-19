import '/core/api/core_models/base_result_model.dart';

class UpdateNoteRequestModel extends BaseResultModel {
  bool? completed;

  UpdateNoteRequestModel({
    this.completed,
  });

  factory UpdateNoteRequestModel.fromJson(Map<String, dynamic> json) =>
      UpdateNoteRequestModel(
        completed: json["completed"],
      );

  @override
  Map<String, dynamic> toJson() => {
        "completed": completed,
      };
}
