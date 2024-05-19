import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:task_manager_app/features/home_page/presentations/widgets/add_pagination_data_database.dart';

import '/core/animations/navigation_route_animation/navigation_route_animation.dart';
import '/core/boilerplate/pagination/cubits/pagination_cubit.dart';
import '/core/boilerplate/pagination/widgets/PaginationList.dart';
import '/core/constants/app_colors.dart';
import '/core/constants/app_theme.dart';
import '/core/database/db/sqflite.dart';
import '/features/home_page/data/get_pagination_notes_respond_moedl.dart';
import '/features/home_page/domain/repository/home_page_repository.dart';
import '/features/home_page/presentations/pages/all_data_home_page.dart';
import '/features/home_page/presentations/widgets/general_home_page_scaffold.dart';
import '/features/home_page/presentations/widgets/note_card.dart';

class PaginationHomePage extends StatefulWidget {
  const PaginationHomePage({super.key});

  @override
  State<PaginationHomePage> createState() => _PaginationHomePageState();
}

class _PaginationHomePageState extends State<PaginationHomePage> {
  final SqfliteDataBase _sqfliteDataBase = SqfliteDataBase();

  final Connectivity _connectivity = Connectivity();

  bool connection = true;

  @override
  Widget build(BuildContext context) {
    return GeneralHomePageScaffold(
      title: "pagination_home_page",
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "notes".tr(),
                style: AppTheme.headline,
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 3),
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: AppColors.blueLightColor,
                ),
                child: InkWell(
                  onTap: () {
                    AnimationNavigation.scalePush(
                        context,
                        FullHomePage(
                          connection: connection,
                        ));
                  },
                  child: Text(
                    "all_notes".tr(),
                    style: AppTheme.headline,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: FutureBuilder(
              future: _checkNetConnection(),
              builder: (context, snapshot) {
                if (connection == true) {
                  return _buildGetNotes();
                } else {
                  return FutureBuilder(
                    future:
                        AddPaginationDataDatabase(sqfliteDataBase: _sqfliteDataBase).readData(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
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
                }
              },
            ),
          ),
        ],
      ),
    );
  }

/*  Future _insertData(List<TodoList> model, int index) async {
    final int id = model[index].id!;
    final int userId = model[index].userId!;
    final String todo = model[index].todo!;

    int respond = await _sqfliteDataBase.insertDatabase('''
    INSERT INTO notes (id, userId, todo)
    VALUES ($id, $userId, "$todo")
    ''');

    print(respond);
  }

  Future _updateData(List<TodoList> model, int index) async {
    final int id = model[index].id!;
    final int userId = model[index].userId!;
    final String todo = model[index].todo!;

    int respond = await _sqfliteDataBase.updateDatabase('''
    UPDATE 'notes'
    SET id = $id, userId = $userId, todo = "$todo"
    WHERE id = $id
    ''');
    print(respond);
  }

  Future _checkDatabase(List<TodoList> model, int index) async {
    int id = model[index].id!;
    List<Map> respond = await _sqfliteDataBase
        .readDatabase("SELECT * FROM 'notes' WHERE id = $id");
    print(respond);
    if (respond.isNotEmpty) {
      return _updateData(model, index);
    } else {
      return _insertData(model, index);
    }
  }

  Future _deleteData(int id) async {
    int respond = await _sqfliteDataBase.deleteMyDatabase('''
    DELETE FROM 'notes' WHERE id = "$id"
    ''');
    print(respond);
  }

  Future readData() async {
    List<Map> response =
        await _sqfliteDataBase.readDatabase("SELECT * FROM notes ");

    print("================database has been read==================");

    return response;
  }*/

  PaginationCubit? _getNotesPaginationCubit;

  _buildGetNotes() {
    return PaginationList<TodoList>(
      withLoading: connection,
      onCubitCreated: (cubit) => _getNotesPaginationCubit = cubit,
      repositoryCallBack: (data) => HomePAgeRepository.getPaginationNotes(data),
      withPagination: true,
      listBuilder: (List<TodoList> list) {
        return _buildListOfNotes(list);
      },
    );
  }

  _buildListOfNotes(dynamic model) {
    return ListView.builder(
      itemCount: connection == true ? model.length : model.data!.length,
      itemBuilder: (BuildContext context, int index) {
        if (connection == true) {
          AddPaginationDataDatabase(sqfliteDataBase: _sqfliteDataBase,
                  index: index, model: model)
              .checkDatabase();
          // _checkDatabase(model, index);
        }
        print(connection);
        return NoteCard(
          model: model,
          index: index,
          connection: connection,
          isPagination: true,
          deleteNote: (id) async {
            AddPaginationDataDatabase(sqfliteDataBase: _sqfliteDataBase, id: id).deleteData();
            //_deleteData(id);
            setState(() {});
          },
          //sqfliteDataBase: _sqfliteDataBase,
        );
      },
    );
  }

  Future _checkNetConnection() async {
    var res = _connectivity.onConnectivityChanged
        .listen((List<ConnectivityResult> event) {
      print(event);
      if (event.contains(ConnectivityResult.none)) {
        connection = false;
        setState(() {});
        EasyLoading.showError("there_is_no_net_connection".tr());
      } else {
        setState(() {});
        connection = true;
        EasyLoading.dismiss();
      }
      print(connection);
    });

    return res;
  }
}
