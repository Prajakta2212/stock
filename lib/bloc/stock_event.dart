import '../model/stock_model.dart';

abstract class StockEvent {}


class LoadStocks extends StockEvent {}


class ReorderStocks extends StockEvent {
  final int oldIndex;
  final int newIndex;

  ReorderStocks(this.oldIndex, this.newIndex);
}


class SaveWatchlist extends StockEvent {
  final List<Stock> updatedList;

  SaveWatchlist(this.updatedList);
}