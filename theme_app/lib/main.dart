import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_app/page_one.dart';
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
    //
    //       LIGHT THEME
    //
    theme: ThemeData(
      primaryColor: Colors.red,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.green,
       
        ),
      useMaterial3: true,
    ),
    //
    //              DARK THEME
    //
    darkTheme: ThemeData(
      primaryColor: Colors.white,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.green,
        brightness: Brightness.dark),
      useMaterial3: true,
    ),
    //
    //
    //
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
          Center(
            child: Text('Hello',style: TextStyle(color: Theme.of(context).primaryColor),),),  //end child
          ElevatedButton(onPressed: (){
            context.read<ThemeProvider>().changeTheme();
          }, child: Text('Click Change Theme')), //end child
          
          ElevatedButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => PageOne(),));
          }, child: Text('Go to page One')),

          
          ],),
    );
  }
}
