import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:realestate/data/property.dart';
import 'package:realestate/repository/real_estate_repository.dart';
import 'package:realestate/repository/real_estate_repository_dummy_impl.dart';
import 'package:realestate/widget/realestateWidget.dart';
import 'package:realestate/widget/propertydetailswidget.dart';

void main() {
  GetIt.instance.registerSingleton<RealEstateRepository>(RealEstateRepositoryDummyImpl());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final colorScheme = ColorScheme.fromSeed(seedColor: Colors.deepPurple);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Real Estate',

      theme: ThemeData(
        colorScheme: colorScheme,
        useMaterial3: true,
        textTheme: const TextTheme(
            bodyMedium: TextStyle(fontSize: 20),
            labelLarge: TextStyle(fontSize: 20),
            bodyLarge: TextStyle(fontSize: 20)
        ),

        appBarTheme: AppBarTheme(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary
        )
      ),
      //home: const MyHomePage(title: 'Flutter Demo Home Page'),
      initialRoute: '/realestate',
      routes: {
        '/realestate': (context) => const RealEstateWidget(),
        '/details' : (context) => const PropertyDetailsWidget(),
      },
     // home: RealEstateWidget(),
    );
  }
}