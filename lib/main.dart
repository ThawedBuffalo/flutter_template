import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/data/repositories/product_repository.dart';
import 'package:flutter_template/presentation/logic/product_bloc.dart';
import 'package:flutter_template/presentation/pages/home/home_page.dart';
import 'data/datasources/mock_product_local_data_source.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AppState();
  }
}

class _AppState extends State<App> {
  final navigatorKey = GlobalKey<NavigatorState>();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Placeholder Page',
      home: BlocProvider(
        create: ((context) => ProductBloc(ProductRepository(dataSource: MockProductLocalDataSource()))),
        child: const HomePage(),
      )
    );
  }
}
