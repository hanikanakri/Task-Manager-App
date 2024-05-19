import '/core/api/core_models/base_result_model.dart';

class GetPaginationNotesRespondModel extends ListResultModel<TodoList> {
  @override
  List<TodoList>? list;
  int? total;
  int? skip;
  int? limit;

  GetPaginationNotesRespondModel({
    this.list,
    this.total,
    this.skip,
    this.limit,
  });

  factory GetPaginationNotesRespondModel.fromJson(Map<String, dynamic> json) =>
      GetPaginationNotesRespondModel(
        list: json["todos"] == null
            ? []
            : List<TodoList>.from(
                json["todos"]!.map((x) => TodoList.fromJson(x))),
        total: json["total"],
        skip: json["skip"],
        limit: json["limit"],
      );

  @override
  Map<String, dynamic> toJson() => {
        "todos": list == null
            ? []
            : List<dynamic>.from(list!.map((x) => x.toJson())),
        "total": total,
        "skip": skip,
        "limit": limit,
      };
}

class TodoList {
  int? id;
  String? todo;
  bool? completed;
  int? userId;

  TodoList({
    this.id,
    this.todo,
    this.completed,
    this.userId,
  });

  factory TodoList.fromJson(Map<String, dynamic> json) => TodoList(
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
