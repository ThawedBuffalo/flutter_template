import 'package:flash/flash_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/core/utils/app_bloc_observer.dart';
import 'package:flutter_template/presentation/logic/product_bloc.dart';
import 'package:flutter_template/presentation/pages/home/home_page.dart';
import 'package:flutter_template/presentation/pages/home_old/home_page_old.dart';
import 'package:flutter_template/themes/buffalo-sabres-light-theme.dart';

import 'data/datasources/mock_product_local_data_source.dart';
import 'data/repositories/product_repository.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  runApp(App());
}

class App extends StatefulWidget {
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
    // return MaterialApp(
    //     title: 'Placeholder Page',
    //     //theme: buffaloSabresLightTheme,
    //     home: MultiBlocProvider(
    //       providers: [
    //         BlocProvider<ProductBloc>(
    //             create: (context) =>
    //                 ProductBloc(context.read<ProductRepository>())),
    //       ],
    //       child: const HomePage(),
    //     )
    //
    //     //
    //     );

    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductBloc>(
            create: (productContext) => ProductBloc(
                productRepository: ProductRepository(
                    dataSource: MockProductLocalDataSource()))),
      ],
      child: const MaterialApp(
        title: 'Product Demo',
        home: HomePage(),
      ),
    );
  }
}
