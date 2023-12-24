import 'package:flutter/material.dart';

class Hesap extends StatefulWidget {
  const Hesap({super.key});

  @override
  State<Hesap> createState() => _HesapState();
}

class _HesapState extends State<Hesap> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.account_circle,size: 50,),
          Text("Merhaba Oya",style: TextStyle(fontSize: 40),)
        ],
      ),
    );
  }
}
