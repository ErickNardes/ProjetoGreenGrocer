// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:core';

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

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
  @override
  String toString() {
    return 'UserModel(nome: $nome, email: $email, telefone: $telefone, cpf: $cpf, senha: $senha, id: $id, token: $token)';
  }
}
