import 'dart:developer';

import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:map/features/domain/entities/user_entity/user_entity.dart';
part 'user.g.dart';

@JsonSerializable()
class User implements UserEntity {
  @override
  final String? name;
  @override
  final String? email;
  @override
  final String? authtoken;
  @override
  final String? id;

  User({
    this.name,
    this.email,
    this.authtoken,
    this.id,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  $UserEntityCopyWith<UserEntity> get copyWith => throw UnimplementedError;
}

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 0; // Unique identifier for this adapter

  @override
  User read(BinaryReader reader) {
    final fields = reader.readMap().cast<String, dynamic>();
    return User.fromJson(fields);
  }

  @override
  void write(BinaryWriter writer, User obj) {
    log(obj.toJson().toString());
    writer.writeMap(obj.toJson());
  }
}
