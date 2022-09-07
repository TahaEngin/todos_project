import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todos_project/model/kayitdurum.dart';
import 'package:todos_project/model/userEmail.dart';
import 'package:todos_project/view/AnaSayfa.dart';
import 'package:todos_project/view/GirisEkrani.dart';
void HesapGirilmis() async{
  final kayitaraci = await SharedPreferences.getInstance();
  kayitaraci.setBool("kayit", true);
  kayitaraci.setString("email", UserEmail!);
}
void HesapCikilmis() async{
  final kayitaraci = await SharedPreferences.getInstance();
  kayitaraci.setBool("kayit", false);
}
void KullanEmail()async{
  final kayitaraci = await SharedPreferences.getInstance();
  UserEmail = kayitaraci.getString("email")!;
}
Future<void> splash(var context) async{
  final kayitaraci = await SharedPreferences.getInstance();
  if(kayitaraci.getBool("kayit")==null || kayitaraci.getBool("kayit")==false){
    kayitDurum=true;
  }
  else{
    kayitDurum=false;
  }
}