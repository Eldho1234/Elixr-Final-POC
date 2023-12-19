import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sampleloginusingapi/constant/const.dart';
import 'package:sampleloginusingapi/model/model.dart';

 
class ApiService {
  static Future<int> signUp(UserDetails user) async {
    var url = Uri.parse(signupUrl);
print(user.emailId);
    var response = await http.post(url,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.encode(user.toMap()));
    return response.statusCode;
  }

static Future<UserDetails> login({
    required String email,
    required String password,
  }) async {
    var signInUrl =
        "https://api.backendless.com/43C785F8-E94F-8BDF-FF5F-5DCF7014DF00/9E836C89-1BBA-405A-A275-5B7199473DDC/data/SignUp?where=email_id='$email' and password='$password' ";

    try {
      var url = Uri.parse(signInUrl);
      var response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (response.statusCode == 200) {
        List jsonData = jsonDecode(response.body);

        if (jsonData.isNotEmpty) {
          return UserDetails.fromMap(jsonData[0] as Map<String, dynamic>);
        } else {
          throw Exception();
        }
      } else {
        throw Exception(
            "Failed to sign in. Status code: ${response.statusCode}");
      }
    } catch (e) {
      rethrow;
    }
  }
}