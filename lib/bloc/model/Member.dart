import 'package:equatable/equatable.dart';
import 'package:split_free/bloc/model/Balance.dart';
import 'package:split_free/bloc/model/Repayment.dart';

class Member extends Equatable {
  final int? id;
  final String firstName;
  final String lastName;
  final String? picture;
  final String email;
  final String registrationStatus;
  final List<Balance> balance;
  final List<Repayment> depts;

  const Member(
      {
        this.id,
        required this.firstName,
        required this.lastName,
        required this.email,
        this.picture,
        required this.depts,
        required this.balance,
        required this.registrationStatus
      });

  @override
  List<Object> get props => [];

  static Member fromJson(dynamic json) {
    return Member(
        id: json['id'],
        firstName: json['first_name'],
        lastName: json['last_name'],
        email: json['email'],
        picture: json['picture'],
        registrationStatus: json['registration_status'],
        balance: json['balance'],
        depts: json['depts']
    );
  }

  @override
  String toString() => 'Member id: $id';
}