import '/core/api/core_models/base_result_model.dart';

class GetAllNotesRespondModel extends BaseResultModel {
  List<Todo>? todos;
  int? total;
  int? skip;
  int? limit;

  GetAllNotesRespondModel({
    this.todos,
    this.total,
    this.skip,
    this.limit,
  });

  factory GetAllNotesRespondModel.fromJson(Map<String, dynamic> json) =>
      GetAllNotesRespondModel(
        todos: json["todos"] == null
            ? []
            : List<Todo>.from(json["todos"]!.map((x) => Todo.fromJson(x))),
        total: json["total"],
        skip: json["skip"],
        limit: json["limit"],
      );

  @override
  Map<String, dynamic> toJson() => {
        "todos": todos == null
            ? []
            : List<dynamic>.from(todos!.map((x) => x.toJson())),
        "total": total,
        "skip": skip,
        "limit": limit,
      };
}

class Todo {
  int? id;
  String? todo;
  bool? completed;
  int? userId;

  Todo({
    this.id,
    this.todo,
    this.completed,
    this.userId,
  });

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
        id: json["id"],
        todo: json["todo"],
        completed: json["completed"],
        userId: json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "todo": todo,
        "completed": completed,
        "userId": userId,
      };
}
