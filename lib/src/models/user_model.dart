// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  @JsonKey(name: 'fullname')
  String? nome;
  String? email;
  String? telefone;
  String? cpf;
  String? senha;
  String? id;
  String? token;

  UserModel({
    this.nome,
    this.email,
    this.telefone,
    this.cpf,
    this.senha,
    this.id,
    this.token,
  });

  @override
  String toString() {
    return 'UserModel(nome: $nome, email: $email, telefone: $telefone, cpf: $cpf, senha: $senha, id: $id, token: $token)';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nome': nome,
      'email': email,
      'telefone': telefone,
      'cpf': cpf,
      'senha': senha,
      'id': id,
      'token': token,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      nome: map['nome'] != null ? map['nome'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      telefone: map['telefone'] != null ? map['telefone'] as String : null,
      cpf: map['cpf'] != null ? map['cpf'] as String : null,
      senha: map['senha'] != null ? map['senha'] as String : null,
      id: map['id'] != null ? map['id'] as String : null,
      token: map['token'] != null ? map['token'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
