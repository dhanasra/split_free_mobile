import '../../../utils/enum_utils.dart';
import 'auth_api_client.dart';

/*
AuthRepository connects
 */
class AuthRepository {

  /*
  AuthApiClient instance
   */
  final AuthApiClient authApiClient;

  AuthRepository({required this.authApiClient});

  Future<dynamic> addUserDetail({
    required String fullName,
    required String email,
    required String phoneNumber,
    required String registrationStatus,
    required SUPPORTED_LOCALE locale
  }) async {
    return await authApiClient.addUserDetail(fullName, email, phoneNumber, registrationStatus, locale);
  }


}