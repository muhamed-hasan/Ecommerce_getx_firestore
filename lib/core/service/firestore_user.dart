import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_getx/model/user_model.dart';

class FirestoreUser {
  final _userCollectionRef =
      FirebaseFirestore.instance.collection('eCommerceUsers');

  Future<void> addUserToFireStore(UserModel userModel) async {
    return await _userCollectionRef
        .doc(userModel.userId)
        .set(userModel.toMap());
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getCurrentUser(
      String uid) async {
    return await _userCollectionRef.doc(uid).get();
  }
}
