import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:yemek_uygulamasi/ui/views/anasayfa.dart';
import 'package:yemek_uygulamasi/ui/views/favori.dart';
import 'package:yemek_uygulamasi/ui/views/hesap.dart';
import 'package:yemek_uygulamasi/ui/views/sepet.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  int secilenIndeks = 0;
  var sayfalar = [const Anasayfa(),const Favori(),const Sepet(),const Hesap()];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: sayfalar[secilenIndeks],
      bottomNavigationBar: Container(color: Colors.redAccent,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
          child: GNav(
            backgroundColor: Colors.redAccent,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.black12,
            gap: 8,
            onTabChange: (index){
              setState(() {
                secilenIndeks = index;
              });
            },
            padding: EdgeInsets.all(16),
            tabs: const [
              GButton(icon: Icons.home_filled,text: "Anasayfa",),
              GButton(icon: Icons.favorite,text: "Favoriler",),
              GButton(icon: Icons.shopping_cart,text: "Sepet",),
              GButton(icon: Icons.account_circle,text: "Kullanıcı",),
            ],
          ),
        ),
      ),
    );
  }
}
