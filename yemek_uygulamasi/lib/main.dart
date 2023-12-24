import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemek_uygulamasi/firebase_options.dart';
import 'package:yemek_uygulamasi/ui/cubit/anasayfa_cubit.dart';
import 'package:yemek_uygulamasi/ui/cubit/detay_sayfa_cubit.dart';
import 'package:yemek_uygulamasi/ui/cubit/favori_cubit.dart';
import 'package:yemek_uygulamasi/ui/cubit/sepet_cubit.dart';
import 'package:yemek_uygulamasi/ui/views/anasayfa.dart';
import 'package:yemek_uygulamasi/ui/views/bottom_nav_bar.dart';
import 'package:yemek_uygulamasi/ui/views/tasarim.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=> AnasayfaCubit()),
        BlocProvider(create: (context)=> DetaySayfaCubit()),
        BlocProvider(create: (context)=> SepetCubit()),
        BlocProvider(create: (context)=> FavoriCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent),
          useMaterial3: true,
        ),
        home: const BottomNavBar(),
      ),
    );
  }
}

