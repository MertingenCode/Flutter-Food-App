import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Tasarim extends StatefulWidget {
  const Tasarim({super.key});

  @override
  State<Tasarim> createState() => _TasarimState();
}

class _TasarimState extends State<Tasarim> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Tasarım"),),
      body: Container(
        width: 153,
        height: 195,
        padding: const EdgeInsets.all(8),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          shadows: [
            BoxShadow(
              color: Color(0x0A000000),
              blurRadius: 60,
              offset: Offset(6, 6),
              spreadRadius: 0,
            ),
          ],
        ),
        child:Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 137,
              height: 106,
              decoration: ShapeDecoration(
                image: DecorationImage(image: NetworkImage("https://yemekapp5678.000webhostapp.com/yemekler/burger.jpg"),
                    fit: BoxFit.fitHeight),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
            Gap(20),
            Text("Ordinary Burgers",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF0F0F0F),
                fontSize: 16,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                height: 0.09,)),
            Gap(12),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:5,right: 3),
                  child: Icon(Icons.star,color: Colors.red,size: 16,),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 37),
                  child: Text("4.9",style: TextStyle(
                    color: Color(0xFF0F0F0F),
                    fontSize: 12,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    height: 0.11,)),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 3),
                  child: Icon(Icons.location_pin,color: Colors.red,size: 16,),
                ),
                Text("190m",style: TextStyle(
                  color: Color(0xFF0F0F0F),
                  fontSize: 12,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  height: 0.11,)),
              ],
            ),
            Gap(15),
            Padding(
              padding: const EdgeInsets.only(right: 58),
              child: Text(
                "65,00TL",
                style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 18,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  height: 0.09,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
