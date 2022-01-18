import 'package:flutter/material.dart';
import 'package:newapp/src/pages/tabs_page.dart';
import 'package:newapp/src/services/news_service.dart';
import 'package:newapp/src/theme/tema.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //Agregamos más de un provider
        ChangeNotifierProvider(create: (_) => new NewsService())
      ],
      child: MaterialApp(
          title: 'Material App',
          debugShowCheckedModeBanner: false,
          theme: myTheme,
          home: TabsPage()),
    );
  }
}
