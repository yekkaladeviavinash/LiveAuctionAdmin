import 'package:admin/models/datemodel.dart';
import 'package:admin/models/productmodel.dart';
import 'package:admin/models/usermodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
//register Controller
//Get.put(HomeController());
//await Firebase.intializeApp

class HomeController extends GetxController {
  Iterable<usermodel>? seller;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference productCollection;
  late CollectionReference datecollection;
  late CollectionReference usercollection;
  List<productmodel> products = [];
  List<datemodel> dateli = [];
  List<dynamic> productids = [];
  List<usermodel> userslist = [];
  @override
  void onInit() async {
    productCollection = firestore.collection('products');
    datecollection = firestore.collection('dates');
    usercollection = firestore.collection('users');
    await fetchProducts();
    super.onInit();
  }

  fetchProducts() async {
    try {
      QuerySnapshot productSnapshot = await productCollection.get();
      final List<productmodel> retrievedProducts = productSnapshot.docs
          .map((doc) =>
              productmodel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
      products.clear();
      products.assignAll(retrievedProducts);

      QuerySnapshot datesnapshot = await datecollection.get();
      final List<datemodel> retrieveddates = datesnapshot.docs
          .map((doc) => datemodel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
      dateli.clear();
      dateli.assignAll(retrieveddates);
      update();
      print('fetched successfully');
      // Get.snackbar('Success', 'Product fetch successfully',
      // colorText: Colors.green);
    } catch (e) {
      // Get.snackbar('Failed', e.toString(), colorText: Colors.red);
      print(e);
    } finally {
      update();
    }
  }

  Future<String?> getProductDate(String id) async {
    try {
      DocumentSnapshot productSnapshot = await productCollection.doc(id).get();

      if (productSnapshot.exists) {
        // Assuming the field name for date is 'dateAdded'
        return productSnapshot['dateAdded'];
      } else {
        // Product with specified ID not found
        return null;
      }
    } catch (e) {
      print("Error retrieving product date: $e");
      return null;
    }
  }

  Future<void> deleteStringFromDate(String date, String pid) async {
    try {
      // Query for the document with the specified date
      QuerySnapshot datesSnapshot =
          await datecollection.where('date', isEqualTo: date).limit(1).get();

      // Check if document exists
      if (datesSnapshot.docs.isNotEmpty) {
        // Get the reference to the document
        DocumentReference docRef = datesSnapshot.docs.first.reference;

        // Get the current data of the document
        Map<String, dynamic>? data =
            datesSnapshot.docs.first.data() as Map<String, dynamic>?;

        if (data != null) {
          // Check if the 'slots' field exists and is a list
          if (data.containsKey('slots') && data['slots'] is List) {
            // Remove the string pid from the 'slots' list
            List<dynamic> slots = List.from(data['slots']);
            slots.remove(pid);

            // Update the document with the modified 'slots' list
            await docRef.update({'slots': slots});
          } else {
            // Handle if 'slots' field doesn't exist or is not a list
            print('Error: No slots field or slots is not a list');
          }
        } else {
          print('Error: Document data is null');
        }
      } else {
        // Handle if document with given date doesn't exist
        print('Document with date $date not found');
      }
    } catch (e) {
      // Handle any errors that occur during the process
      print('Error deleting string from date: $e');
    }
  }

  Future<void> deleteProduct(String id) async {
    try {
      String? prdate = await getProductDate(id);
      if (prdate != null) {
        await deleteStringFromDate(prdate, id);
        await productCollection.doc(id).delete();
        await fetchProducts();
      } else {
        Get.snackbar('Failed', 'Product date is null', colorText: Colors.red);
      }
    } catch (e) {
      Get.snackbar('Failed', e.toString(), colorText: Colors.red);
      print(e);
    }
  }

  int getProductIndexandtime(String productId) {
    return getProducttime(productids.indexOf(productId));
  }

  int getProducttime(int n) {
    if (n == 0) return 9;
    if (n == 1) return 11;
    if (n == 2) return 14;
    if (n == 3) return 16;
    if (n == 4) {
      return 18;
    } else {
      return 0;
    }
  }

  getproductdate(String docId, String date) async {
    // String todaydate = DateFormat("yyyy-MM-dd").format(date);
    // print(todaydate);
    try {
      QuerySnapshot datesnapshot = await datecollection.get();
      final List<datemodel> retrieveddates = datesnapshot.docs
          .map((doc) => datemodel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
      dateli.clear();
      dateli.assignAll(retrieveddates);
      update();
    } catch (e) {
      print("Error shown in todayauction controller ${e}");
    }
    Iterable<datemodel> today = dateli.where((datess) => datess.date == date);
    for (var dateModel in today) {
      // Check if slots exist and add them to productids
      if (dateModel.slots != null) {
        // print(dateModel.slots.length.toString()+"helooooo");
        productids.addAll(dateModel.slots);
      }
    }
  }

  getuserdetails(String userid) async {
    try {
      QuerySnapshot usersnapshot = await usercollection.get();
      final List<usermodel> retrievedusers = usersnapshot.docs.map((doc) {
        final userData = doc.data();
        if (userData != null) {
          // print(userData as Map<String, dynamic>);
          return usermodel.fromJson(userData as Map<String, dynamic>);
        } else {
          throw Exception('Document data is null');
        }
      }).toList();

      userslist.clear();
      userslist.assignAll(retrievedusers);
      update();
    } catch (e) {
      print("Error shown in seller controller ${e}");
    }
    Iterable<usermodel> curruser =
        userslist.where((user) => user.uid == userid);
    seller = curruser;
  }

  void statusupdate(String docId, String date) async {
    try {
      await getproductdate(docId, date);
      int index = getProductIndexandtime(docId);
      await productCollection.doc(docId).update({
        'status': true,
        'ptime': index,
      });
      productids.clear();
      fetchProducts();
      Get.snackbar('Acceped', "Accepted".toString(), colorText: Colors.green);
    } catch (e) {
      print("Error updating document: $e");
    } finally {
      update();
    }
  }

  refreshPage() async {
    await fetchProducts();
    update();
  }
}
