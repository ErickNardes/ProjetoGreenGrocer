import 'package:greengrocer/src/constants/end_point.dart';
import 'package:greengrocer/src/models/user_model.dart';
import 'package:greengrocer/src/pages/auth/repository/auth_errors.dart'
    as authError;
import 'package:greengrocer/src/pages/auth/result/auth_result.dart';
import 'package:greengrocer/src/services/http_maneger.dart';

class AuthRepository {
  final httpManeger _httpManeger = httpManeger();

  Future<AuthResult> validateToken(String token) async {
   final result = await _httpManeger.restRequiest(
      url: EndPoint.validateToken,
      method: HttpMethods.post,
      headers: {'X-Parse-Session-Token': token,}
    );
    if (result['result'] != null) {
      final user = UserModel.fromJson(result['result']);
      return AuthResult.success(user);
    } else {
      return AuthResult.error(authError.authErrorsString(result['error']));
    }
  }

  Future<AuthResult> signIn({
    required String email,
    required String senha,
  }) async {
    final result = await _httpManeger.restRequiest(
      url: EndPoint.signin,
      method: HttpMethods.post,
      body: {
        "email": email,
        "password": senha,
      },
    );
    if (result['result'] != null) {
      final user = UserModel.fromJson(result['result']);
      return AuthResult.success(user);
    } else {
      return AuthResult.error(authError.authErrorsString(result['error']));
    }
  }
}
