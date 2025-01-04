import 'package:flutter/material.dart';
import 'package:flutter_app_test/core/api_factory.dart';
import 'package:flutter_app_test/core/app_config.dart';
import 'package:flutter_app_test/data/datasource/data_source.dart';
import 'package:flutter_app_test/presentation/bloc/user_cubit.dart';
import 'package:flutter_app_test/presentation/pages/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  const Environment currentEnvironment = Environment.development;

  AppConfig.initialize(currentEnvironment);
  // Inicializar ApiFactory y DataSource
  final apiFactory = ApiFactory();
  final dataSource = DataSource(apiFactory);

  runApp(BlocProvider(
    create: (context) => UserCubit(
      dataSource,
    ),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cubit with API Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'Cubit API Demo Home Page'),
    );
  }
}
