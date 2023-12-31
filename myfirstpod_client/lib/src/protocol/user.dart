/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

class UserData extends _i1.SerializableEntity {
  UserData({
    this.id,
    required this.username,
    required this.email,
    required this.password,
    this.token,
  });

  factory UserData.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return UserData(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      username: serializationManager
          .deserialize<String>(jsonSerialization['username']),
      email:
          serializationManager.deserialize<String>(jsonSerialization['email']),
      password: serializationManager
          .deserialize<String>(jsonSerialization['password']),
      token:
          serializationManager.deserialize<String?>(jsonSerialization['token']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String username;

  String email;

  String password;

  String? token;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'password': password,
      'token': token,
    };
  }
}
