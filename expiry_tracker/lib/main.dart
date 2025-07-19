import 'package:expiry_tracker/shared/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:expiry_tracker/shared/constants/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Jó reggelt, Anett Fehér",
        notificationsCount: 0,
        profileImageUrl: "https://i.ibb.co/5X06GKsw/profile.png",
      ),
      backgroundColor: AppColors.bgColorDefault,
      body: Container(),
    );
  }
}
