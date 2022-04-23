import 'dart:convert';

List<User> userFromJson(String str) => List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

User singleUserFromJson(String str) => User.fromJson(json.decode(str));

String singleUserToJson(User data) => json.encode(data);
class User {
  User({
    this.email,
    this.firstName,
    this.secondName,
    this.password,
    this.token,
    this.id,
  });

  String? email;
  String? firstName;
  String? secondName;
  String? password;
  String? token;
  String? id;

  factory User.fromJson(Map<String, dynamic> json) => User(
    email: json["email"],
    firstName: json["first_name"],
    secondName: json["second_name"],
    password: json["password"],
    token: json["token"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "first_name": firstName,
    "second_name": secondName,
    "password": password,
    "token": token,
    "id": id,
  };
}
