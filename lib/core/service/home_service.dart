import 'package:cloud_firestore/cloud_firestore.dart';

class HomeService {
  final _categoriesCollectionRef =
      FirebaseFirestore.instance.collection('eComCategories');

  getCategory() async {
    final value = await _categoriesCollectionRef.get();
    return value.docs;
  }
}
