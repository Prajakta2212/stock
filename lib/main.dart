
import 'package:flutter/material.dart';
import 'package:stock/bloc/stock_bloc.dart';
import 'package:stock/bloc/stock_event.dart';
import 'package:stock/data/stock_repository.dart';
import 'package:stock/ui/screens/home_screen.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final repository = StockRepository();

  @override
  Widget build(BuildContext context) {
   return MaterialApp(
    debugShowCheckedModeBanner: false,
  home: BlocProvider(
    create: (_) => StockBloc(repository)..add(LoadStocks()),
    child: HomeScreen(),
  ),
);
  }
}