import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../services/shared_preferences.service.dart';
import '../../../shared/message.dart';
import '../../home_page/view/home_page.dart';
part 'login.store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  @observable
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @observable
  TextEditingController emailController = TextEditingController();

  @observable
  TextEditingController passwordController = TextEditingController();

  @observable
  bool showPassword = false;

  @action
  void toggleShowPassword() {
    showPassword = !showPassword;
  }

  @observable
  bool loading = false;

  @action
  Future<void> login(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      loading = true;

      await Future.delayed(
        const Duration(milliseconds: 1200),
      );

      loading = false;

      if (emailController.text != 'teste@gmail.com' ||
          passwordController.text != '123456') {
        message(
          'Email ou senha inválidos',
        );

        return;
      }

      SharedPreferencesService sharedPreferencesService =
          SharedPreferencesService();

      sharedPreferencesService.saveData(
        'logged',
        'true',
      );

      Navigator.pushAndRemoveUntil(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
        (route) => false,
      );
    }
  }
}
