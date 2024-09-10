import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_planner/models/note_database.dart';
import 'package:simple_planner/pages/notes_page.dart';
import 'package:simple_planner/theme/theme_provider.dart'; // Add this import

void main() async {
  // Initialize the database
  WidgetsFlutterBinding.ensureInitialized();
  await NoteDatabase.initialize();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => NoteDatabase()),
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Planner',
      debugShowCheckedModeBanner: false,
      home: const NotesPage(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
