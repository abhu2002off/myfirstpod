/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:myfirstpod_client/src/protocol/article_class.dart' as _i3;
import 'package:myfirstpod_client/src/protocol/weather_class.dart' as _i4;
import 'package:myfirstpod_client/src/protocol/user.dart' as _i5;
import 'package:myfirstpod_client/src/protocol/login_user.dart' as _i6;
import 'dart:io' as _i7;
import 'protocol.dart' as _i8;

class _EndpointArticle extends _i1.EndpointRef {
  _EndpointArticle(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'article';

  _i2.Future<List<_i3.Article>> getArticle({String? keyword}) =>
      caller.callServerEndpoint<List<_i3.Article>>(
        'article',
        'getArticle',
        {'keyword': keyword},
      );

  _i2.Future<bool> addArticle(_i3.Article article) =>
      caller.callServerEndpoint<bool>(
        'article',
        'addArticle',
        {'article': article},
      );

  _i2.Future<bool> deleteArticle(int id) => caller.callServerEndpoint<bool>(
        'article',
        'deleteArticle',
        {'id': id},
      );

  _i2.Future<bool> updateArticle(_i3.Article article) =>
      caller.callServerEndpoint<bool>(
        'article',
        'updateArticle',
        {'article': article},
      );

  _i2.Future<_i4.WeatherInfo> getWeatherInfo(int cityId) =>
      caller.callServerEndpoint<_i4.WeatherInfo>(
        'article',
        'getWeatherInfo',
        {'cityId': cityId},
      );
}

class _EndpointExample extends _i1.EndpointRef {
  _EndpointExample(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'example';

  _i2.Future<String> hello(String name) => caller.callServerEndpoint<String>(
        'example',
        'hello',
        {'name': name},
      );
}

class _EndpointUser extends _i1.EndpointRef {
  _EndpointUser(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'user';

  _i2.Future<Map<String, dynamic>> registerUser(_i5.UserData user) =>
      caller.callServerEndpoint<Map<String, dynamic>>(
        'user',
        'registerUser',
        {'user': user},
      );

  _i2.Future<Map<String, dynamic>> loginUser(_i6.LoginData login) =>
      caller.callServerEndpoint<Map<String, dynamic>>(
        'user',
        'loginUser',
        {'login': login},
      );

  _i2.Future<Map<String, dynamic>> verifyToken(String tokendata) =>
      caller.callServerEndpoint<Map<String, dynamic>>(
        'user',
        'verifyToken',
        {'tokendata': tokendata},
      );

  _i2.Future<Map<String, dynamic>> changePassword(
    String oldPassword,
    String password,
    String confirmPassword,
  ) =>
      caller.callServerEndpoint<Map<String, dynamic>>(
        'user',
        'changePassword',
        {
          'oldPassword': oldPassword,
          'password': password,
          'confirmPassword': confirmPassword,
        },
      );

  _i2.Future<Map<String, dynamic>> updateUserDetails(
    String? email,
    DateTime? dob,
    int? phoneNo,
    String? profilePic,
  ) =>
      caller.callServerEndpoint<Map<String, dynamic>>(
        'user',
        'updateUserDetails',
        {
          'email': email,
          'dob': dob,
          'phoneNo': phoneNo,
          'profilePic': profilePic,
        },
      );
}

class Client extends _i1.ServerpodClient {
  Client(
    String host, {
    _i7.SecurityContext? context,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
  }) : super(
          host,
          _i8.Protocol(),
          context: context,
          authenticationKeyManager: authenticationKeyManager,
        ) {
    article = _EndpointArticle(this);
    example = _EndpointExample(this);
    user = _EndpointUser(this);
  }

  late final _EndpointArticle article;

  late final _EndpointExample example;

  late final _EndpointUser user;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'article': article,
        'example': example,
        'user': user,
      };
  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {};
}
