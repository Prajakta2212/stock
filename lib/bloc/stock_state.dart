import 'package:equatable/equatable.dart';
import '../model/stock_model.dart';

abstract class StockState extends Equatable {
  @override
  List<Object?> get props => [];
}


class StockInitial extends StockState {}


class StockLoaded extends StockState {
  final List<Stock> stocks;

   StockLoaded(this.stocks);


  StockLoaded copyWith({List<Stock>? stocks}) {
    return StockLoaded(stocks ?? this.stocks);
  }

  @override
  List<Object?> get props => [stocks];
}