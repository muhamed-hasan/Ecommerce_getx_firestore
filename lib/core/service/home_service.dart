import 'package:cloud_firestore/cloud_firestore.dart';

class HomeService {
  final _categoriesCollectionRef =
      FirebaseFirestore.instance.collection('eComCategories');
  final _productCollectionRef =
      FirebaseFirestore.instance.collection('eComProducts');

  getCategory() async {
    final value = await _categoriesCollectionRef.get();
    return value.docs;
  }

  getBestSelling() async {
    final value = await _productCollectionRef.get();
    return value.docs;
  }
}
