import 'package:equatable/equatable.dart';

class Repayment extends Equatable {
  final int from;
  final int to;
  final String amount;

  const Repayment(
      {
        required this.from,
        required this.to,
        required this.amount,
      });

  @override
  List<Object> get props => [];

  static Repayment fromJson(dynamic json) {
    return Repayment(
        from: json['from'],
        to: json['to'],
        amount: json['amount'],
    );
  }

  @override
  String toString() => 'Repayment amount: $amount';
}