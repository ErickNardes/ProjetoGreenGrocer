import 'package:get/get.dart';

String? emailValidator(String? email) {
  if (email == null || email.isEmpty) {
    return 'Digite seu email!';
  }
  if (!email.isEmail) return 'Digite um Email válido!';

  return null;
}

String? senhaValidator(senha) {
  if (senha == null || senha.isEmpty) return 'Digite sua senha!';
  if (senha.length < 7) return 'Digite uma senha com pelo menos 7 digitos';

  return null;
}

String? nameValidator(String? name) {
  if (name == null || name.isEmpty) {
    return 'Digite um Nome!';
  }
  final names = name.split(' ');

  if (names.length == 1) return 'Digite seu nome completo!';
  return null;
}

String? phoneValidator(String? phone) {
  if (phone == null || phone.isEmpty) {
    return 'Digite um celular!';
  }

  if(phone.length < 14 || !phone.isPhoneNumber) return 'Digite um número válido';
  return null;
}

String? cpfValidator (String? cpf){
   if (cpf == null || cpf.isEmpty) {
    return 'Digite um CPF!';
  }

  if(!cpf.isCpf) return 'Digite um CPF válido';
  return null;
}
