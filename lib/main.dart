import 'package:flutter/material.dart';
import 'package:provider_state_management/provider/model.dart';
import 'package:provider_state_management/routes/rouotes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Model(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    RoutesPage route = RoutesPage();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: (settings) => route.getRoutes(settings),
    );
  }
}
