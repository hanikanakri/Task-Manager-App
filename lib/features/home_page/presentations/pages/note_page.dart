import 'package:flutter/material.dart';

import '/core/constants/app_assets.dart';
import '/core/constants/app_colors.dart';
import '/core/constants/app_theme.dart';
import '/features/auth/presentations/widgets/auth_details_card.dart';
import '/features/home_page/presentations/widgets/general_home_page_scaffold.dart';

class NotePage extends StatelessWidget {
  const NotePage({
    super.key,
    this.index,
    this.model,
    required this.connection,
    required this.isPagination,

  });

  final dynamic model;
  final int? index;
  final bool connection;
  final bool isPagination;


  @override
  Widget build(BuildContext context) {
    return GeneralHomePageScaffold(
      title: "note",
      body: Center(
        child: AuthDetailsCard(
          assetsName: AppAssets.noteHomePage,
          authName:

          isPagination ==true

              ?

          connection == true
                  ? "${model!.todos![index!].id!}"
                  : "${model.data![index]["id"]}"

              :

          connection == true
                  ? "${model!.todos![index!].id!}"
                  : "${model.data![index]["id"]}",
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.all(12),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.lightGrey,
            ),
            child: Text(

              isPagination ==true

                  ?

             connection == true
                      ? "${model!.todos![index!].todo!}"
                      : "${model.data![index]["todo"]}"

                  :

              connection == true
                      ? "${model!.todos![index!].todo!}"
                      : "${model.data![index]["todo"]}",
              style: AppTheme.bodySmall,
            ),
          ),
        ),
      ),
    );
  }
}
