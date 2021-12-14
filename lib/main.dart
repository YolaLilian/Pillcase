import 'package:flutter/material.dart';
import 'package:pill_case/screens/home_screen.dart';
import 'package:pill_case/view_models/pill_list_view_model.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pills',
        home: MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (_) => PillListViewModel(),
            )
          ],
          child: HomeScreen(),
        ));
  }
}
