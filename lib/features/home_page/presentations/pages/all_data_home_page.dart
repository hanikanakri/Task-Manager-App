import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '/core/animations/list_view_animations.dart';
import '/core/boilerplate/get_model/cubits/get_model_cubit.dart';
import '/core/boilerplate/get_model/widgets/GetModel.dart';
import '/core/constants/app_theme.dart';
import '/core/database/db/sqflite.dart';
import '/features/home_page/data/get_all_notes_respond_model.dart';
import '/features/home_page/domain/repository/home_page_repository.dart';
import '/features/home_page/presentations/widgets/add_all_data_database.dart';
import '/features/home_page/presentations/widgets/general_home_page_scaffold.dart';
import '/features/home_page/presentations/widgets/note_card.dart';

class FullHomePage extends StatefulWidget {
  FullHomePage({
    super.key,
    this.connection,
  });

  bool? connection;

  @override
  State<FullHomePage> createState() => FullHomePageState();
}

class FullHomePageState extends State<FullHomePage> {
  final SqfliteDataBase _sqfliteDataBase = SqfliteDataBase();

  AllDataDatabase? allDataDatabase;

  @override
  Widget build(BuildContext context) {
    return GeneralHomePageScaffold(
      title: "full_home_page",
      body: Column(
        children: [
          Expanded(
            child: ConditionalBuilder(
              condition: widget.connection == false,
              fallback: (context) {
                return _buildGetNotes();
              },
              builder: (context) {
                return FutureBuilder(
                  future: AllDataDatabase(sqfliteDataBase: _sqfliteDataBase).readData(),
                  builder: (context, AsyncSnapshot<List<Map>> snapshot) {
                    if (snapshot.hasData) {
                      snapshot.data!.length;
                      return _buildListOfNotes(snapshot);
                    } else {
                      return Center(
                        child: Text(
                          "there_is_no_notes".tr(),
                          style: AppTheme.headline,
                        ),
                      );
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

/*  Future _insertData(GetAllNotesRespondModel model, int index) async {
    final int id = model.todos![index].id!;
    final int userId = model.todos![index].userId!;
    final String todo = model.todos![index].todo!;

    int respond = await _sqfliteDataBase.insertDatabase('''
    INSERT INTO notes (id, userId, todo) 
    VALUES ($id, $userId, "$todo")
    ''');

    print(respond);
  }

  Future _updateData(GetAllNotesRespondModel model, int index) async {
    final int id = model.todos![index].id!;
    final int userId = model.todos![index].userId!;
    final String todo = model.todos![index].todo!;

    int respond = await _sqfliteDataBase.updateDatabase('''
    UPDATE 'notes'
    SET id = $id, userId = $userId, todo = "$todo"
    WHERE id = $id
    ''');
    print(respond);
  }

  Future _checkDatabase(GetAllNotesRespondModel model, int index) async {
    int id = model.todos![index].id!;
    List<Map> respond = await _sqfliteDataBase
        .readDatabase("SELECT * FROM notes WHERE id = $id");
    print(respond);
    if (respond.isNotEmpty) {
      return _updateData(model, index);
    } else {
      return _insertData(model, index);
    }
  }

  Future deleteData(int id) async {
    int respond = await _sqfliteDataBase.deleteMyDatabase('''
    DELETE FROM 'notes' WHERE id = "$id"
    ''');
    print(respond);
  }

  Future<List<Map>> readData() async {
    List<Map> response =
        await _sqfliteDataBase.readDatabase("SELECT * FROM notes ");

    print("================database has been read==================");

    return response;
  }
  */
  GetModelCubit? getNotesCubit;

  _buildGetNotes() {
    return GetModel<GetAllNotesRespondModel>(
      onCubitCreated: (cubit) => getNotesCubit = cubit,
      repositoryCallBack: (data) => HomePAgeRepository.getNotes(),
      onSuccess: (GetAllNotesRespondModel model) async {},
      modelBuilder: (GetAllNotesRespondModel model) {
        return _buildListOfNotes(model);
      },
    );
  }

  _buildListOfNotes(dynamic model) {
    return ListViewAnimations(
      itemCount:
          widget.connection == true ? model.todos.length : model.data!.length,
      itemBuilder: (BuildContext context, int index) {
        if (widget.connection == true) {
          AllDataDatabase(sqfliteDataBase: _sqfliteDataBase, index: index, model: model)
              .checkDatabase();
          // _checkDatabase(model, index);
        }
        return ListAnimation(
          index: index,
          child: NoteCard(
            model: model,
            index: index,
            isPagination: false,
            deleteNote: (id) async {
              AllDataDatabase(sqfliteDataBase: _sqfliteDataBase, id: id).deleteData();
              // deleteData(id);
              setState(() {});
            },
            connection: widget.connection!,
            //sqfliteDataBase: _sqfliteDataBase,
          ),
        );
      },
    );
  }
}
