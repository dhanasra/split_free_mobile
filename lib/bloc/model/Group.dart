import 'package:equatable/equatable.dart';
import 'package:split_free/bloc/model/Member.dart';

class Group extends Equatable {
  final int? id;
  final String name;
  final String type;
  final String createdAt;
  final String updatedAt;
  final String avatar;
  final String inviteCode;
  final List<Member> members;

  const Group(
      {
        this.id,
        required this.name,
        required this.type,
        required this.createdAt,
        required this.updatedAt,
        required this.avatar,
        required this.inviteCode,
        required this.members
      });

  @override
  List<Object> get props => [];

  static Group fromJson(dynamic json) {
    return Group(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      avatar: json['avatar'],
      inviteCode: json['invite_code'],
      members: json['members']
    );
  }

  @override
  String toString() => 'UserDetail id: $id';
}