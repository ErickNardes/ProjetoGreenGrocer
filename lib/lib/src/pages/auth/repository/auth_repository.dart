import 'package:greengrocer/src/constants/end_point.dart';
import 'package:greengrocer/src/models/user_model.dart';
import 'package:greengrocer/src/pages/auth/repository/auth_errors.dart'
    as authError;
import 'package:greengrocer/src/pages/auth/result/auth_result.dart';
import 'package:greengrocer/src/services/http_maneger.dart';

class AuthRepository {
  final httpManeger _httpManeger = httpManeger();

  AuthResult handleUserOrError(Map<dynamic, dynamic> result) {
    if (result['result'] != null) {
      final user = UserModel.fromJson(result['result']);
      return AuthResult.success(user);
    } else {
      return AuthResult.error(authError.authErrorsString(result['error']));
    }
  }

  // Método para validar TOKEN
  Future<AuthResult> validateToken(dynamic token) async {
    final result = await _httpManeger.restRequest(
        url: EndPoint.validateToken,
        method: HttpMethods.post,
        headers: {
          'X-Parse-Session-Token': token,
        });
   return handleUserOrError(result);
  }

  Future<AuthResult> signIn({
    required String email,
    required String senha,
  }) async {
    final result = await _httpManeger.restRequest(
      url: EndPoint.signin,
      method: HttpMethods.post,
      body: {
        "email": email,
        "password": senha,
      },
    );
    return handleUserOrError(result);
  }

  Future<AuthResult> signUp(UserModel user) async {
    final result = await _httpManeger.restRequest(
      url: EndPoint.signup,
      method: HttpMethods.post,
      // TODO enviar dados
      body: user.toJson(),
    );
  return  handleUserOrError(result);
  }
}
