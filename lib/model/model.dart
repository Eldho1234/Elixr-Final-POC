// To parse this JSON data, do
//
//     final userDetails = userDetailsFromJson(jsonString);

import 'dart:convert';

List<UserDetails> userFromMap(String str) =>
    List<UserDetails>.from(json.decode(str).map((x) => UserDetails.fromMap(x)));

String userToMap(List<UserDetails> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class UserDetails {
    String? emailId;
    String? password;
    int? created;
    dynamic name;
    String? userDetailClass;
    String? lastName;
    dynamic ownerId;
    dynamic updated;
    String? firstName;
    String? objectId;

    UserDetails({
        this.emailId,
        this.password,
        this.created,
        this.name,
        this.userDetailClass,
        this.lastName,
        this.ownerId,
        this.updated,
        this.firstName,
        this.objectId,
    });

   factory UserDetails.fromMap(Map<String, dynamic> json) => UserDetails(
        firstName: json["first_name"],
        lastName: json["last_name"],
        // empid: json["empid"],
        emailId: json["email_id"],
        password: json["password"],
      );

  Map<String, dynamic> toMap() => {
        "first_name": firstName,
        "last_name": lastName,
        // "empid": empid,
        "email_id": emailId,
        "password": password,
      };
      
  String getFullname(){
    return '$firstName $lastName';
  }    
  @override
  String toString() {
    return 'User{firstName: $firstName, lastName: $lastName, email: $emailId, password: $password}';
  }
}
