import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_vertexai/firebase_vertexai.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_ia/features/home/bloc_home/home_bloc.dart';
import 'package:poc_ia/features/home/presentation/home_page.dart';
import 'package:poc_ia/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final model =
      FirebaseVertexAI.instance.generativeModel(model: 'gemini-1.5-flash');
  GenerationConfig(responseMimeType: 'application/json', temperature: 10);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/home',
      routes: {
        '/home': (_) => BlocProvider(
              create: (_) => HomeBloc(),
              child: HomePage(),
            )
      },
    );
  }
}
