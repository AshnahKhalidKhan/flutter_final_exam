import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_final_exam/Core/network.dart';
import 'package:flutter_final_exam/Models/product_model.dart';

class DataRepository
{
  final DataAPIClient dataAPIClient;
  final FirebaseFirestore firebaseFirestore;
  String _email = FirebaseAuth.instance.currentUser!.email.toString();

  DataRepository({required this.firebaseFirestore, required this.dataAPIClient});

  Future<List<Products>> getDataFutureFunctionRepositoryFile() async
  {
    return dataAPIClient.fecthDataFutureFunctionNetworkFile();
  }  

  Future<void> createDataFutureFunctionRepositoryFile(Products product) async 
  {
    try 
    {
      await firebaseFirestore.collection('products').add(product.toJson());
    }
    catch (e)
    {
      print('Error adding product: $e');
    }
  }

  Future<List<Products>> readDataFutureFunctionRepositoryFile() async 
  {
    try 
    {
      QuerySnapshot querySnapshot = await firebaseFirestore.collection('products').get();
      return querySnapshot.docs
          .map((doc) => Products.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    }
    catch (e)
    {
      print('Error getting products: $e');
      return [];
    }
  }

  Future<void> updateDataFutureFunctionRepositoryFile(String productId, Products product) async 
  {
    try 
    {
      await firebaseFirestore.collection('products').doc(productId).update(product.toJson());
    } 
    catch (e) 
    {
      print('Error updating product: $e');
    }
  }

  Future<void> deleteDataFutureFunctionRepositoryFile(String productId) async 
  {
    try 
    {
      await firebaseFirestore.collection('products').doc(productId).delete();
    } 
    catch (e) 
    {
      print('Error deleting product: $e');
    }
  }
}