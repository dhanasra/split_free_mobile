import 'package:equatable/equatable.dart';

class UserDetail extends Equatable {
  final int? id;
  final String firstName;
  final String lastName;
  final String? picture;
  final String email;
  final String phone;
  final String registrationStatus;
  final String locale;
  final String? countryCode;
  final String? dateFormat;
  final String? defaultCurrency;
  final int? notificationsCount;
  final int? notificationsRead;
  final String? timeZone;

  const UserDetail(
      {
        this.id,
        required this.firstName,
        required this.lastName,
        required this.phone,
        required this.email,
        required this.countryCode,
        this.dateFormat,
        this.defaultCurrency,
        required this.locale,
        this.notificationsCount,
        this.notificationsRead,
        this.picture,
        required this.registrationStatus,
        this.timeZone
      });

  @override
  List<Object> get props => [];

  static UserDetail fromJson(dynamic json) {
    return UserDetail(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      phone: json['phone'],
      email: json['email'],
      countryCode: json['country_code'],
      dateFormat: json['date_format'],
      defaultCurrency: json['default_currency'],
      locale: json['locale'],
      notificationsCount: json['notifications_count'],
      notificationsRead: json['notifications_read'],
      picture: json['picture'],
      registrationStatus: json['registration_status'],
      timeZone: json['time_zone']
    );
  }

  @override
  String toString() => 'UserDetail id: $id';
}