import 'package:cloud_firestore/cloud_firestore.dart';

class UserProfile {
  final String? id;
  final String? userName;
  final String? email;
  final String? sexe;
  final Timestamp? birtthDate;
  final String? imageUrl;
  final Timestamp? createdAt;
  final Timestamp? updatedAt;
  final String? address;

  UserProfile({
    required this.id,
    required this.userName,
    required this.email,
    required this.sexe,
    this.birtthDate,
    required this.createdAt,
    this.imageUrl,
    this.updatedAt,
    this.address,
  });
}
