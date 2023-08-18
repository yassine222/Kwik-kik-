import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DocumentIdController extends GetxController {
  final CollectionReference _collectionReference;

  DocumentIdController(String collectionPath)
      : _collectionReference =
            FirebaseFirestore.instance.collection(collectionPath);

  RxList<String> documentIds = RxList<String>();

  @override
  void onInit() {
    super.onInit();
    fetchDocumentIds();
  }

  Future<void> fetchDocumentIds() async {
    try {
      final querySnapshot = await _collectionReference.get();
      documentIds.value = querySnapshot.docs.map((doc) => doc.id).toList();
    } catch (e) {
      // Handle error
      print('Error fetching document IDs: $e');
    }
  }
}
