import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> kayitol(String mail,String pass,String pass2,String name,String surname) async{
  await FirebaseAuth.instance.createUserWithEmailAndPassword(email: mail, password: pass);
  await FirebaseFirestore.instance.collection("users").doc(mail).set({"email":mail,"name":name,"surname":surname,"password":pass2});
}