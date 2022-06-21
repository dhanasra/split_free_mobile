import 'package:equatable/equatable.dart';

class Balance extends Equatable {
  final String amount;
  final String currencyCode;

  const Balance(
      {
        required this.amount,
        required this.currencyCode
      });

  @override
  List<Object> get props => [];

  static Balance fromJson(dynamic json) {
    return Balance(
      amount: json['amount'],
      currencyCode: json['currency_code']
    );
  }

  @override
  String toString() => 'Balance amount: $amount';
}