/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'article_class.dart' as _i2;
import 'example.dart' as _i3;
import 'login_user.dart' as _i4;
import 'password.dart' as _i5;
import 'token.dart' as _i6;
import 'user.dart' as _i7;
import 'weather_class.dart' as _i8;
import 'package:myfirstpod_client/src/protocol/article_class.dart' as _i9;
export 'article_class.dart';
export 'example.dart';
export 'login_user.dart';
export 'password.dart';
export 'token.dart';
export 'user.dart';
export 'weather_class.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Map<Type, _i1.constructor> customConstructors = {};

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (customConstructors.containsKey(t)) {
      return customConstructors[t]!(data, this) as T;
    }
    if (t == _i2.Article) {
      return _i2.Article.fromJson(data, this) as T;
    }
    if (t == _i3.Example) {
      return _i3.Example.fromJson(data, this) as T;
    }
    if (t == _i4.LoginData) {
      return _i4.LoginData.fromJson(data, this) as T;
    }
    if (t == _i5.Password) {
      return _i5.Password.fromJson(data, this) as T;
    }
    if (t == _i6.Token) {
      return _i6.Token.fromJson(data, this) as T;
    }
    if (t == _i7.UserData) {
      return _i7.UserData.fromJson(data, this) as T;
    }
    if (t == _i8.WeatherInfo) {
      return _i8.WeatherInfo.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i2.Article?>()) {
      return (data != null ? _i2.Article.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i3.Example?>()) {
      return (data != null ? _i3.Example.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i4.LoginData?>()) {
      return (data != null ? _i4.LoginData.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i5.Password?>()) {
      return (data != null ? _i5.Password.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i6.Token?>()) {
      return (data != null ? _i6.Token.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i7.UserData?>()) {
      return (data != null ? _i7.UserData.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i8.WeatherInfo?>()) {
      return (data != null ? _i8.WeatherInfo.fromJson(data, this) : null) as T;
    }
    if (t == List<_i9.Article>) {
      return (data as List).map((e) => deserialize<_i9.Article>(e)).toList()
          as dynamic;
    }
    if (t == Map<String, dynamic>) {
      return (data as Map).map((k, v) =>
          MapEntry(deserialize<String>(k), deserialize<dynamic>(v))) as dynamic;
    }
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    if (data is _i2.Article) {
      return 'Article';
    }
    if (data is _i3.Example) {
      return 'Example';
    }
    if (data is _i4.LoginData) {
      return 'LoginData';
    }
    if (data is _i5.Password) {
      return 'Password';
    }
    if (data is _i6.Token) {
      return 'Token';
    }
    if (data is _i7.UserData) {
      return 'UserData';
    }
    if (data is _i8.WeatherInfo) {
      return 'WeatherInfo';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'] == 'Article') {
      return deserialize<_i2.Article>(data['data']);
    }
    if (data['className'] == 'Example') {
      return deserialize<_i3.Example>(data['data']);
    }
    if (data['className'] == 'LoginData') {
      return deserialize<_i4.LoginData>(data['data']);
    }
    if (data['className'] == 'Password') {
      return deserialize<_i5.Password>(data['data']);
    }
    if (data['className'] == 'Token') {
      return deserialize<_i6.Token>(data['data']);
    }
    if (data['className'] == 'UserData') {
      return deserialize<_i7.UserData>(data['data']);
    }
    if (data['className'] == 'WeatherInfo') {
      return deserialize<_i8.WeatherInfo>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
