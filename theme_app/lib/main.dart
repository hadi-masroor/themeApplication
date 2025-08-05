import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_app/colors.dart';
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
      /*extensions: [
        const AppColors(success: Colors.blue, warning: Colors.red),
      ],
*/
      extensions: [
        const AppColors(
          colorOne: Colors.black,
          colorTwo: Colors.green,
          colorThree: Colors.blue,
          colorFour: Colors.orange,
        ),
      ],
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
      extensions: [
        const AppColors(
          colorOne: Colors.white,
          colorTwo: Colors.lightGreen,
          colorThree: Colors.cyan,
          colorFour: Colors.deepOrange,
        ),
      ],
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
          SizedBox(height: 16,),
          ElevatedButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => PageOne(),));
          }, child: Text('..:: Go to other page ::..')),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text('Color in light: black  and  color in dark: white',style: TextStyle(fontSize: 20, color: Theme.of(context).extension<AppColors>()!.colorOne),),
              Text('Color in light: green  and  color in dark: lightGreen',style: TextStyle(fontSize: 20, color: Theme.of(context).extension<AppColors>()!.colorTwo),),
              Text('Color in light: blue  and  color in dark: cyan',style: TextStyle(fontSize: 20, color: Theme.of(context).extension<AppColors>()!.colorThree),),
              Text('Color in light: orange  and  color in dark: deepOrange',style: TextStyle(fontSize: 20, color: Theme.of(context).extension<AppColors>()!.colorFour),),
            ],
          )
          

          
          ],),
    );
  }
}
