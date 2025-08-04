import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_app/theme_provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_)=>ThemeProvider()),


    ],
    child: MyApp(),)
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final ThemeProvider themeProvider = context.watch<ThemeProvider>();
    return MaterialApp(
    debugShowCheckedModeBanner: false,
    title: ' Theme ',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.blue,
        background: Colors.amber,
        brightness: Brightness.light,
        primary: Colors.blue,
        ),
      //brightness: Brightness.light,
      useMaterial3: true,
    ),
    darkTheme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple,brightness: Brightness.dark),
      //brightness: Brightness.dark,
      useMaterial3: true,
    ),
    themeMode: themeProvider.themeMode,
    home: const MyHomePage(),
  );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Theme'),),
      body: Column(
        children: [
          Center
          (child: Text('Hello'),),  //end child
          ElevatedButton(onPressed: (){
            context.read<ThemeProvider>().changeTheme();
          }, child: Text('Click Change Theme'))
          
          ],),
    );
  }
}
