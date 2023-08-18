import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kwik_kik/controller/auth_controller.dart';

import '../model/profile.dart';

class UserProfileController extends GetxController {
  final CollectionReference _userProfileCollection =
      FirebaseFirestore.instance.collection('userProfile');

  Rx<UserProfile?> loggedInUserProfile =
      Rx<UserProfile?>(null); // Initialize with null

  @override
  void onInit() {
    super.onInit();
    // Fetch logged-in user's profile on initialization
    fetchLoggedInUserProfile();
  }

  Future<void> fetchLoggedInUserProfile() async {
    try {
      final loggedInUserId = AuthController.instance.auth.currentUser!.uid;
      final snapshot = await _userProfileCollection.doc(loggedInUserId).get();
      if (snapshot.exists) {
        loggedInUserProfile.value = UserProfile(
            id: snapshot.get('id'),
            userName: snapshot.get('username'),
            email: snapshot.get('email'),
            sexe: snapshot.get('sexe'),
            birtthDate: snapshot.get('birthdate'),
            createdAt: snapshot.get('createdAt'),
            updatedAt: snapshot.get('createdAt'),
            address: snapshot.get('address'),
            imageUrl: snapshot.get('image'));
      }
    } catch (e) {
      // Handle error
      print('Error fetching logged-in user profile: $e');
    }
  }

  Future<void> createProfile(UserProfile userProfile) async {
    try {
      await _userProfileCollection.doc(userProfile.id).set({
        'id': userProfile.id,
        'username': userProfile.userName ?? "",
        'email': userProfile.email,
        'sexe': userProfile.sexe ?? 'Rather dont say',
        'birthdate': userProfile.birtthDate ?? null,
        'createdAt': userProfile.createdAt,
        'image': userProfile.imageUrl ??
            'https://static.vecteezy.com/system/resources/previews/021/548/095/original/default-profile-picture-avatar-user-avatar-icon-person-icon-head-icon-profile-picture-icons-default-anonymous-user-male-and-female-businessman-photo-placeholder-social-network-avatar-portrait-free-vector.jpg',
        'updatedAt': userProfile.updatedAt ?? userProfile.createdAt,
        'address': userProfile.address ?? '',
        'isProfileSet': true,
      });
    } catch (e) {
      // Handle error
      print('Error creating profile: $e');
    }
  }

  Future<void> updateProfile(UserProfile userProfile) async {
    try {
      await _userProfileCollection.doc(userProfile.id).set({
        'id': userProfile.id,
        'username': userProfile.userName,
        'email': userProfile.email,
        'sexe': userProfile.sexe,
        'birthdate': userProfile.birtthDate,
        'createdAt': userProfile.createdAt,
        'image': userProfile.imageUrl ??
            'https://static.vecteezy.com/system/resources/previews/021/548/095/original/default-profile-picture-avatar-user-avatar-icon-person-icon-head-icon-profile-picture-icons-default-anonymous-user-male-and-female-businessman-photo-placeholder-social-network-avatar-portrait-free-vector.jpg',
        'updatedAt': userProfile.updatedAt,
        'address': userProfile.address,
      });
    } catch (e) {
      // Handle error
      print('Error creating profile: $e');
    }
  }

  Future<void> deleteProfile(String profileId) async {
    // ... (add the delete operation)
  }
}
