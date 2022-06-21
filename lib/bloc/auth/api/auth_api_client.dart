import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../utils/enum_utils.dart';
import '../../../utils/url_utils.dart';
import '../../model/UserDetail.dart';

/*
Api Client for Auth Model.
All Auth requests processed here.
 */
class AuthApiClient {

  /*
  BASE_URL-> Rest Api base url.
  httpClient-> Client object to fetch data.
   */
  final _baseUrl = UrlUtils.BASE_URL;
  late final http.Client httpClient;

  /*
  Constructor with httpClient.
   */
  AuthApiClient({required this.httpClient});

  var headers = {
    'Content-Type': 'application/json'
  };

  Future<dynamic> addUserDetail(
      String fullName,
      String email,
      String phoneNumber,
      String registrationStatus,
      SUPPORTED_LOCALE locale
      ) async{
    try {
      var request = http.Request('POST', Uri.parse('${_baseUrl}user'));

      List name = fullName.split(" ");

      request.body = jsonEncode({
        "first_name": name[0],
        "last_name": name[1]??name[0],
        "email": email,
        "phone": phoneNumber,
        "locale": locale.name,
        "registration_status": registrationStatus
      });

      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      String responseStr = await response.stream.bytesToString();
      Map<dynamic, dynamic> json = jsonDecode(responseStr);
      UserDetail userDetail = UserDetail.fromJson(json);

      print(userDetail);
      if (response.statusCode == 200) {
        return userDetail;
      } else {
        return "error";
      }
    }catch(e){
      print(e);
      return "error";
    }
  }

}