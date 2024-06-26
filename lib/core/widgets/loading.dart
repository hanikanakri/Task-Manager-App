import '/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

//import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
//   return SpinKitPouringHourGlass(color: AppColors.primaryColor,size: 25,);
    return SpinKitFadingCircle(
      itemBuilder: (BuildContext context, int index) {
        return DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), //border corner radius
            color:
                index.isEven ? AppColors.primaryColor : AppColors.primaryColor,
          ),
        );
      },
      size: 35,
    );
//    return const Center(
//      child: SizedBox(
//        width: 20,
//        height: 20,
//        child: CircularProgressIndicator(
//          strokeWidth: 1,
//          color: AppColors.lightBlueColor,
//        ),
//      ),
//    );
  }
}
