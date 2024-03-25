import 'package:admin/models/productmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
//register Controller
//Get.put(HomeController());
//await Firebase.intializeApp

class HomeController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference productCollection;

  List<productmodel> products = [];
  @override
  void onInit()async {
    productCollection = firestore.collection('products');
    await fetchProducts();
    super.onInit();
  }

  fetchProducts() async {
    try {
      QuerySnapshot productSnapshot = await productCollection.get();
      final List<productmodel> retrievedProducts = productSnapshot.docs
          .map((doc) => productmodel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
      products.clear();
      products.assignAll(retrievedProducts);
      print('fetched successfully');
      // Get.snackbar('Success', 'Product fetch successfully',
          // colorText: Colors.green);
    } catch (e) {
      // Get.snackbar('Failed', e.toString(), colorText: Colors.red);
      print(e);
    }
    finally{
      update();
    }
  }

 deleteProduct(String id){
  try {
  productCollection.doc(id).delete();
  fetchProducts();
}  catch (e) {
   Get.snackbar('Failed', e.toString(), colorText: Colors.red);
      print(e);
}
 }

void statusupdate(String docId) async {
  try {
    await productCollection.doc(docId).update({
      'status': true,
      // Add other fields you want to update here
    });
    fetchProducts();
  } catch (e) {
    print("Error updating document: $e");
  } finally {
    update();
  }
}
}
