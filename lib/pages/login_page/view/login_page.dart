import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:projeto_teste/pages/login_page/store/login.store.dart';

import '../../../layout/colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginStore store = LoginStore();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Observer(builder: (_) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.primary,
                  Colors.white,
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Form(
                key: store.formKey,
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          controller: store.emailController,
                          decoration: const InputDecoration(
                            labelText: 'E-mail',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, insira um e-mail';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: store.passwordController,
                          obscureText: !store.showPassword,
                          decoration: InputDecoration(
                            labelText: 'Senha',
                            suffixIcon: IconButton(
                              icon: Icon(
                                store.showPassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () => store.toggleShowPassword(),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, insira uma senha';
                            }
                            if (value.length < 6) {
                              return 'A senha deve ter no mínimo 6 caracteres';
                            }

                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        /* TextButton(
                            onPressed: () => store.login(context),
                            style: ButtonStyle(
                              fixedSize: WidgetStateProperty.all<Size>(
                                Size(size.width - 55, 50),
                              ),
                              backgroundColor: WidgetStateProperty.all<Color>(
                                const Color.fromRGBO(
                                  7,
                                  29,
                                  65,
                                  1,
                                ),
                              ),
                              shape:
                                  WidgetStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                            ),
                            child: const Text(
                              'Entrar',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ), */
                        InkWell(
                          onTap: () => store.login(
                            context,
                          ),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                            width: store.loading ? 50 : size.width - 55,
                            height: 50,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(7, 29, 65, 1),
                              borderRadius: BorderRadius.circular(
                                store.loading ? 50 : 5,
                              ),
                            ),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                AnimatedOpacity(
                                  duration: const Duration(milliseconds: 300),
                                  opacity: store.loading ? 0.0 : 1.0,
                                  child: const Text(
                                    'Entrar',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  child: AnimatedOpacity(
                                    duration: const Duration(milliseconds: 300),
                                    opacity: store.loading ? 1.0 : 0.0,
                                    child: const SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
