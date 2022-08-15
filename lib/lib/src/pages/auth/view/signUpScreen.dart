import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greengrocer/src/config/custom_color.dart';
import 'package:greengrocer/src/pages/auth/controller/auth_controller.dart';
import 'package:greengrocer/src/pages/widgets/custom_text_field.dart';
import 'package:greengrocer/src/services/validators.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final cpfFormatter = MaskTextInputFormatter(
      mask: '###.###.###-##', filter: {'#': RegExp(r'[0-9]')});
  final phoneFormatter = MaskTextInputFormatter(
      mask: '## # ####-####', filter: {'#': RegExp(r'[0-9]')});

  final _formKey = GlobalKey<FormState>();
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: CustomColors.customSwatColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          child: Stack(
            children: [
              Column(
                children: [
                  const Expanded(
                    child: Center(
                      child: Text(
                        'Cadastro',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                        ),
                      ),
                    ),
                  ),

                  //Formulário
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 40),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(45),
                      ),
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CustomTextField(
                            validator: emailValidator,
                            textInputType: TextInputType.emailAddress,
                            icon: Icons.email,
                            label: 'Email',
                            onSaved: (value) {
                              authController.user.email = value;
                            },
                          ),
                          CustomTextField(
                            validator: senhaValidator,
                            textInputType: TextInputType.number,
                            icon: Icons.lock,
                            label: 'Senha',
                            isSecret: true,
                            onSaved: (value) {
                              authController.user.senha = value;
                            },
                          ),
                          CustomTextField(
                            validator: nameValidator,
                            icon: Icons.person,
                            label: 'Nome',
                            onSaved: (value) {
                              authController.user.nome = value;
                            },
                          ),
                          CustomTextField(
                            validator: phoneValidator,
                            textInputType: TextInputType.number,
                            inputFormatters: [phoneFormatter],
                            icon: Icons.phone,
                            label: 'Celular',
                            onSaved: (value) {
                              authController.user.telefone = value;
                            },
                          ),
                          CustomTextField(
                            validator: cpfValidator,
                            textInputType: TextInputType.number,
                            inputFormatters: [cpfFormatter],
                            icon: Icons.file_copy,
                            label: 'CPF',
                            onSaved: (value) {
                              authController.user.cpf = value;
                            },
                          ),
                          SizedBox(
                            height: 50,
                            child: Obx(
                              () {
                                return ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                  ),
                                  onPressed: authController.isLoading.value
                                      ? null
                                      : () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            _formKey.currentState!.save();
                                            authController.signUp();
                                          }
                                        },
                                  child: authController.isLoading.value
                                      ? CircularProgressIndicator()
                                      : const Text(
                                          'Cadastrar Usuário',
                                          style: TextStyle(fontSize: 18),
                                        ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Positioned(
                    left: 10,
                    top: 10,
                    child: SafeArea(
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
