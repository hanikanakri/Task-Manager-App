import '/core/database/db/sqflite.dart';
import '/features/home_page/data/get_pagination_notes_respond_moedl.dart';

class AddPaginationDataDatabase{

  List<TodoList>? model; int? index; int? id; SqfliteDataBase? sqfliteDataBase;

  AddPaginationDataDatabase({this.id,this.index,this.model,this.sqfliteDataBase,});


  Future insertData() async {
    final int id = model![index!].id!;
    final int userId = model![index!].userId!;
    final String todo = model![index!].todo!;

    int respond = await sqfliteDataBase!.insertDatabase('''
    INSERT INTO notes (id, userId, todo) 
    VALUES ($id, $userId, "$todo")
    ''');

    print(respond);
  }

  Future updateData() async {
    final int id = model![index!].id!;
    final int userId = model![index!].userId!;
    final String todo = model![index!].todo!;

    int respond = await sqfliteDataBase!.updateDatabase('''
    UPDATE 'notes'
    SET id = $id, userId = $userId, todo = "$todo"
    WHERE id = $id
    ''');
    print(respond);
  }

  Future checkDatabase() async {
    int id = model![index!].id!;
    List<Map> respond = await sqfliteDataBase!
        .readDatabase("SELECT * FROM 'notes' WHERE id = $id");
    print(respond);
    if (respond.isNotEmpty) {
      return updateData();
    } else {
      return insertData();
    }
  }

  Future deleteData({int? idD}) async {
    int deleteId =idD ?? id!;
    int respond = await sqfliteDataBase!.deleteMyDatabase('''
    DELETE FROM 'notes' WHERE id = "$deleteId"
    ''');
    print(respond);
  }

  Future readData() async {
    List<Map> response =
    await sqfliteDataBase!.readDatabase("SELECT * FROM notes ");

    print("================database has been read==================");

    return response;
  }




}