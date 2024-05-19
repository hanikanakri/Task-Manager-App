import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '/core/animations/navigation_route_animation/navigation_route_animation.dart';
import '/core/api/core_models/empty_model.dart';
import '/core/boilerplate/create_model/cubits/create_model_cubit.dart';
import '/core/boilerplate/create_model/widgets/CreateModel.dart';
import '/core/constants/app_assets.dart';
import '/core/constants/app_theme.dart';
import '/core/database/db/sqflite.dart';
import '/core/widgets/custom_image.dart';
import '/features/home_page/data/delete_note_respond_model.dart';
import '/features/home_page/data/update_note_request_model.dart';
import '/features/home_page/domain/repository/home_page_repository.dart';
import '/features/home_page/presentations/pages/note_page.dart';

class NoteCard extends StatelessWidget {
  NoteCard({
    super.key,
    this.model,
    this.index,
    this.deleteNote,
    required this.connection,
    required this.isPagination,

    //this.sqfliteDataBase,
  });

  final dynamic model;
  final Future Function(int id)? deleteNote;



  final int? index;

  bool connection;
  bool isPagination;

  //final SqfliteDataBase? sqfliteDataBase;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Column(
        children: [
          _buildUpdateNote(

            isPagination == true ?

               connection == true
                  ? model![index!].id!
                  : model.data![index]["id"]

            :

            connection == true
                ? model!.todos![index!].id!
                : model.data![index]["id"],

          ),
          Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                onTap: () {
                  AnimationNavigation.slidePush(
                    context,
                    NotePage(
                      index: index,
                      model: model,
                      connection: connection,
                      isPagination: isPagination,
                    ),
                  );
                },
                title: Text(

                  isPagination ==true

                      ?

                  connection == true
                          ? model![index!].todo!
                          : model.data![index]["todo"]

                      :

                  connection == true
                          ? model!.todos![index!].todo!
                          : model.data![index]["todo"],
                  style: AppTheme.bodySmall,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                trailing: _buildDeleteNote(

                    isPagination ==true

                        ?

                    connection == true
                        ? model![index!].id!
                        : model.data![index]["id"]

                        :

                    connection == true
                        ? model!.todos![index!].id!
                        : model.data![index]["id"]),
                leading: Text(

                  isPagination ==true

                      ?

                connection == true
                          ? "${model![index!].id!}"
                          : "${model.data![index]["id"]}"

                      :

                  connection == true
                          ? "${model!.todos![index!].id!}"
                          : "${model.data![index]["id"]}",
                  style: AppTheme.bodySmall,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  CreateModelCubit? _deleteNoteCubit;

  CreateModelCubit? _editNoteCubit;

  _buildUpdateNote(int id) {
    return CreateModel<UpdateNoteRequestModel>(
      repositoryCallBack: (data) => HomePAgeRepository.updateNote(data, id),
      onCubitCreated: (cubit) => _editNoteCubit = cubit,
      onSuccess: (model) {},
      child: const SizedBox(),
    );
  }

  _buildDeleteNote(int id) {
    return CreateModel<DeleteNoteRespondModel>(
      repositoryCallBack: (data) => HomePAgeRepository.deleteNote(id),
      onCubitCreated: (cubit) {
        _deleteNoteCubit = cubit;
      },
      onSuccess: (DeleteNoteRespondModel model) {},
      child: DropdownButton<String>(
        hint: CustomImage.rectangle(
          image: AppAssets.editNoteHomePage,
          isNetworkImage: false,
          fit: BoxFit.cover,
          width: 15,
          height: 15,
        ),
        items: <String>['edit', 'delete'].map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value.tr(),
              style: AppTheme.bodySmall,
            ),
          );
        }).toList(),
        onChanged: (value) {
          switch (value) {
            case "delete":
              print("delete");
              deleteNote!(

                isPagination ==true

                    ?

                connection == true
                    ? model![index!].id!
                    : model.data![index]["id"]

                    :

                connection == true
                    ? model!.todos![index!].id!
                    : model.data![index]["id"],

              ).then((value) {
                _deleteNoteCubit!.createModel(EmptyModel());
              });



              break;
            case "edit":
              print("edit");
              _editNoteCubit!.createModel(
                UpdateNoteRequestModel(
                  completed: true,
                ),
              );
              break;
            default:
              break;
          }
        },
      ),
    );
  }
}
