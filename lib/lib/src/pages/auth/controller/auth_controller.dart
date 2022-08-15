import 'package:get/get.dart';
import 'package:greengrocer/src/constants/storage_keys.dart';
import 'package:greengrocer/src/models/user_model.dart';
import 'package:greengrocer/src/pages/auth/repository/auth_repository.dart';
import 'package:greengrocer/src/pages/auth/result/auth_result.dart';
import 'package:greengrocer/src/pages_route/app_pages.dart';
import 'package:greengrocer/src/services/utils_services.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;

  final authRepository = AuthRepository();
  final utilsServices = UtilsServices();

  UserModel user = UserModel();

  @override
  void onInit() {
    super.onInit();

    validateToken();
  }

  Future<void> validateToken() async {
    // Recuperar o token que foi salvo localmente
    String? token = await utilsServices.getLocalData(
      key: StorageKeys.token,
    );
    if (token == null) {
      Get.offAllNamed(PagesRoute.signInRoute);
      return;
    }
    AuthResult result = await authRepository.validateToken(token);
    result.when(
      success: (user) {
        this.user = user;
        saveTokenAndProceedToBase();
      },
      error: (messager) {
        singOut();
      },
    );
  }

  Future<void> singOut() async {
    // Zerar user
    user = UserModel();

    // Remover Token Local
    await utilsServices.removeLocalData(key: StorageKeys.token);

    // Ir para o login
    Get.offAllNamed(PagesRoute.signInRoute);
  }

  void saveTokenAndProceedToBase() {
    // Salvar token
    utilsServices.savelocalData(key: StorageKeys.token, data: user.token!);

    // Ir para tela Base
    Get.offAllNamed(PagesRoute.baseRoute);
  }

  Future<void> signUp() async {
    isLoading.value = true;
    AuthResult result = await authRepository.signUp(user);
    isLoading.value = false;

    result.when(success: (user) {
      this.user = user;

      saveTokenAndProceedToBase();

    }, error: (messager) {
      utilsServices.showToast(
          messager: messager,
          isError: true,
        );
    });
  }

  Future<void> singIn({
    required String email,
    required String senha,
  }) async {
    isLoading.value = true;
    AuthResult result = await authRepository.signIn(email: email, senha: senha);

    isLoading.value = false;

    result.when(
      success: (user) {
        this.user = user;
        saveTokenAndProceedToBase();
      },
      error: (messager) {
        utilsServices.showToast(
          messager: messager,
          isError: true,
        );
        print(messager);
      },
    );
  }
}
