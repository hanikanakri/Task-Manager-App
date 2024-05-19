import '/core/database/db/sqflite.dart';
import '/features/home_page/data/get_all_notes_respond_model.dart';

class AllDataDatabase {
  GetAllNotesRespondModel? model;
  int? index;
  int? id;
  SqfliteDataBase? sqfliteDataBase;

  AllDataDatabase(
     {this.sqfliteDataBase,
    this.id,
    this.model,
    this.index,
  });

  Future<List<Map>> readData() async {
    List<Map> response =
        await sqfliteDataBase!.readDatabase("SELECT * FROM notes ");

    print("================database has been read==================");

    return response;
  }

  Future insertData() async {
    final int id = model!.todos![index!].id!;
    final int userId = model!.todos![index!].userId!;
    final String todo = model!.todos![index!].todo!;

    int respond = await sqfliteDataBase!.insertDatabase('''
    INSERT INTO notes (id, userId, todo) 
    VALUES ($id, $userId, "$todo")
    ''');

    print(respond);
  }

  Future updateData() async {
    final int id = model!.todos![index!].id!;
    final int userId = model!.todos![index!].userId!;
    final String todo = model!.todos![index!].todo!;

    int respond = await sqfliteDataBase!.updateDatabase('''
    UPDATE 'notes'
    SET id = $id, userId = $userId, todo = "$todo"
    WHERE id = $id
    ''');
    print(respond);
  }

  Future checkDatabase() async {
    int id = model!.todos![index!].id!;
    List<Map> respond = await sqfliteDataBase!
        .readDatabase("SELECT * FROM notes WHERE id = $id");
    print(respond);
    if (respond.isNotEmpty) {
      return updateData();
    } else {
      return insertData();
    }
  }

  Future deleteData() async {
    int respond = await sqfliteDataBase!.deleteMyDatabase('''
    DELETE FROM 'notes' WHERE id = "$id"
    ''');
    print(respond);
  }
}
