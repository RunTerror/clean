// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserEntity {
  String? get name => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get authtoken => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserEntityCopyWith<UserEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserEntityCopyWith<$Res> {
  factory $UserEntityCopyWith(
          UserEntity value, $Res Function(UserEntity) then) =
      _$UserEntityCopyWithImpl<$Res, UserEntity>;
  @useResult
  $Res call({String? name, String? email, String? authtoken, String? id});
}

/// @nodoc
class _$UserEntityCopyWithImpl<$Res, $Val extends UserEntity>
    implements $UserEntityCopyWith<$Res> {
  _$UserEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? email = freezed,
    Object? authtoken = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      authtoken: freezed == authtoken
          ? _value.authtoken
          : authtoken // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserEntityImplCopyWith<$Res>
    implements $UserEntityCopyWith<$Res> {
  factory _$$UserEntityImplCopyWith(
          _$UserEntityImpl value, $Res Function(_$UserEntityImpl) then) =
      __$$UserEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? name, String? email, String? authtoken, String? id});
}

/// @nodoc
class __$$UserEntityImplCopyWithImpl<$Res>
    extends _$UserEntityCopyWithImpl<$Res, _$UserEntityImpl>
    implements _$$UserEntityImplCopyWith<$Res> {
  __$$UserEntityImplCopyWithImpl(
      _$UserEntityImpl _value, $Res Function(_$UserEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? email = freezed,
    Object? authtoken = freezed,
    Object? id = freezed,
  }) {
    return _then(_$UserEntityImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      authtoken: freezed == authtoken
          ? _value.authtoken
          : authtoken // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$UserEntityImpl implements _UserEntity {
  const _$UserEntityImpl({this.name, this.email, this.authtoken, this.id});

  @override
  final String? name;
  @override
  final String? email;
  @override
  final String? authtoken;
  @override
  final String? id;

  @override
  String toString() {
    return 'UserEntity(name: $name, email: $email, authtoken: $authtoken, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserEntityImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.authtoken, authtoken) ||
                other.authtoken == authtoken) &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, email, authtoken, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserEntityImplCopyWith<_$UserEntityImpl> get copyWith =>
      __$$UserEntityImplCopyWithImpl<_$UserEntityImpl>(this, _$identity);
}

abstract class _UserEntity implements UserEntity {
  const factory _UserEntity(
      {final String? name,
      final String? email,
      final String? authtoken,
      final String? id}) = _$UserEntityImpl;

  @override
  String? get name;
  @override
  String? get email;
  @override
  String? get authtoken;
  @override
  String? get id;
  @override
  @JsonKey(ignore: true)
  _$$UserEntityImplCopyWith<_$UserEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
