import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_getx/model/user_model.dart';

class FirestoreUser {
  final _userCollectionRef =
      FirebaseFirestore.instance.collection('eCommerceUsers');

  addUserToFireStore(UserModel userModel) async {
    return await _userCollectionRef
        .doc(userModel.userId)
        .set(userModel.toMap());
  }
}
