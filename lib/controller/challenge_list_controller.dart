import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChallengeListController extends GetxController {
  final CollectionReference _collectionReference;

  final String challengeTypeId;

  ChallengeListController(String collectionPath, this.challengeTypeId)
      : _collectionReference =
            FirebaseFirestore.instance.collection(collectionPath);

  RxList<String> documentIds = RxList<String>();

  @override
  void onInit() {
    super.onInit();
    fetchNestedDocumentIds(challengeTypeId);
  }

  Future<void> fetchNestedDocumentIds(String challengeTypeId) async {
    try {
      final nestedCollectionReference = _collectionReference
          .doc(challengeTypeId)
          .collection('challengeList'); // Replace with your subcollection name

      final querySnapshot = await nestedCollectionReference.get();
      documentIds.value = querySnapshot.docs.map((doc) => doc.id).toList();
    } catch (e) {
      // Handle error
      print('Error fetching nested document IDs: $e');
    }
  }
}
