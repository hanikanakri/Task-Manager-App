import 'package:flutter/material.dart';

import '/core/animations/navigation_route_animation/navigation_route_animation.dart';
import '/core/boilerplate/create_model/cubits/create_model_cubit.dart';
import '/core/boilerplate/create_model/widgets/CreateModel.dart';
import '/core/constants/app_assets.dart';
import '/core/utils/shared_storage.dart';
import '/core/utils/validators.dart';
import '/core/widgets/buttons/main_elevated_button.dart';
import '/core/widgets/custom_text_field.dart';
import '/features/auth/data/login_request_model.dart';
import '/features/auth/data/login_respond_model.dart';
import '/features/auth/domain/repository/auth_repository.dart';
import '/features/auth/presentations/widgets/auth_details_card.dart';
import '/features/auth/presentations/widgets/general_auth_scaffold.dart';
import '/features/home_page/presentations/pages/pagination_home_page.dart';

class RegisterAuth extends StatelessWidget {
  RegisterAuth({super.key});

  final TextEditingController _emailController =
      TextEditingController(text: "kminchelle");
  final TextEditingController _passwordController =
      TextEditingController(text: "0lelplR");

  final GlobalKey<FormState> _loginKey = GlobalKey<FormState>();

  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GeneralAuthScaffold(
      title: "login",
      body: Form(
        key: _loginKey,
        child: Center(
          child: AuthDetailsCard(
            authName: "welcome_back",
            assetsName: AppAssets.loginAuth,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ...[
                    CustomTextField(
                      hintText: "email_address",
                      controller: _emailController,
                      imageData: AppAssets.emailAuth,
                      textInputAction: TextInputAction.next,
                      focusNode: _emailFocusNode,
                      onEditingComplete: () =>
                          FocusScope.of(context).nextFocus(),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) =>
                          Validator.emptyValue(value!, context),
                    ),
                    CustomTextField(
                      hintText: "password",
                      imageData: AppAssets.passwordAuth,
                      controller: _passwordController,
                      validator: (value) =>
                          Validator.emptyValue(value!, context),
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      focusNode: _passwordFocusNode,
                      textInputAction: TextInputAction.done,
                      onEditingComplete: () {
                        if (_loginKey.currentState!.validate()) {
                          _loginCubit!.createModel(
                            LoginRequestModel(
                              username: _emailController.text,
                              password: _passwordController.text,
                            ),
                          );
                        }
                      },
                    ),
                    _buildAuthRegister(context),
                  ].expand(
                    (element) => [
                      element,
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  CreateModelCubit? _loginCubit;

  _buildAuthRegister(BuildContext context) {
    return CreateModel<LoginRespondModel>(
      repositoryCallBack: (data) => AuthRepository.logIn(data),
      onCubitCreated: (cubit) {
        _loginCubit = cubit;
      },
      onSuccess: (LoginRespondModel model) {
        SharedStorage.writeToken(model.token);
        AnimationNavigation.sizePushReplacement(context, const PaginationHomePage());
      },
      child: MainElevatedButton(
        onPressed: () {
          if (_loginKey.currentState!.validate()) {
            _loginCubit!.createModel(
              LoginRequestModel(
                username: _emailController.text,
                password: _passwordController.text,
                expiresInMins: 30,
              ),
            );
          }
        },
        text: "login",
      ),
    );
  }
}
