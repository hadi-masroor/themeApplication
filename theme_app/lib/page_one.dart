import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_app/colors.dart';
import 'package:theme_app/theme_provider.dart';

class PageOne extends StatefulWidget {
  const PageOne({super.key});

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        context.read<ThemeProvider>().changeTheme();
      },
      child:context.watch<ThemeProvider>().themeMode==ThemeMode.light? Icon(Icons.light_mode):Icon(Icons.dark_mode),),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('data one',style: TextStyle(fontSize: 40,color: colors.colorOne),),
            Text('data two',style: TextStyle(fontSize: 40,color: colors.colorTwo),),
            Text('data text',style: TextStyle(fontSize: 40,color: colors.colorThree),),
            Text('data four',style: TextStyle(fontSize: 40,color: colors.colorFour),),
          ],
        ),
      ),
    );
  }
}




