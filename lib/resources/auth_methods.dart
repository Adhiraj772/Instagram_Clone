import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone_flutter/resources/storage_methods.dart';

class AuthMethods {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  //sign up user
 Future <String> signUpUser({
  required String email,
   required String username,
  required String password,
  required String bio,
  required Uint8List file,
}) async {
   String res= "Some error occured";
   try{
     if(email.isNotEmpty||password.isNotEmpty||bio.isNotEmpty||file!=null){
       // register user
      UserCredential cred = await auth.createUserWithEmailAndPassword(email: email, password: password);
      String photoUrl = await StorageMethods().uploadImageToStorage('profilePics', file, false);
      // adding user to our database

       await firestore.collection('users').doc(cred.user!.uid).set({
         'username': username,
         'uid': cred.user!.uid,
         'email':email,
         'bio': bio,
         'followers': [],
         'following':[],
        'photoUrl': photoUrl,

       });
       res = "success";


     }

   }
   catch(err){
     res= err.toString();
   }
   return res;
 }
 // logging in user
Future<String> loginUser({required String email,required String password})async{
   String res = 'Some error occured';
   try{
     if(email.isNotEmpty||password.isNotEmpty){
       await auth.signInWithEmailAndPassword(email: email, password: password);
       res='success';
     }else{
       res = 'Please enter all the fields';
     }

   }catch(err){
     res = err.toString();

   }
   return res;
}

}