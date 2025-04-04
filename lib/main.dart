import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scraping_ia/firebase_options.dart';
import 'package:scraping_ia/src/core/utils/theme.dart';
import 'package:scraping_ia/src/providers/gemini_description.dart';
import 'package:scraping_ia/src/providers/image_ia.dart';
import 'package:scraping_ia/src/screens/home/home_screen.dart';

import 'src/data/data.dart';
import 'src/providers/providers.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => GeminiProvider()),
        ChangeNotifierProvider(
          create: (_) => GeminiDescriptionProvider(),
        ),

        ChangeNotifierProvider(
          create: (_) => ScrapingProvider(
            repository: ScrapingRepository(),
            geminiProvider: GeminiProvider(),
          ),
        ),
        // ChangeNotifierProvider(create: (_) => UserProvider(userRepository)..checkLoginStatus()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey, // ← ¡clave para que funcione!
      title: 'Flutter Demo',
      theme: AppTheme.light,
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
