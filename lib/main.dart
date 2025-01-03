import 'package:flutter/material.dart';
import 'package:flutter_app_test/core/api_factory.dart';
import 'package:flutter_app_test/core/app_config.dart';
import 'package:flutter_app_test/data/datasource/data_source.dart';
import 'package:flutter_app_test/presentation/pages/home.dart';

void main() {

  const Environment currentEnvironment = Environment.development;


  AppConfig.initialize(currentEnvironment);
   // Inicializar ApiFactory y DataSource
  final apiFactory = ApiFactory();
  final dataSource = DataSource(apiFactory);

  runApp(MyApp(dataSource: dataSource));
}

class MyApp extends StatelessWidget {
  final DataSource dataSource;

  const MyApp({super.key, required this.dataSource});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(
        title: 'Flutter Demo Home Page',
        dataSource: dataSource,
      ),
    );
  }
}
