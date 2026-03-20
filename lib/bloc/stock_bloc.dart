import 'package:flutter_bloc/flutter_bloc.dart';
import 'stock_event.dart';
import 'stock_state.dart';
import '../data/stock_repository.dart';
import '../model/stock_model.dart';

class StockBloc extends Bloc<StockEvent, StockState> {
  final StockRepository repository;

  StockBloc(this.repository) : super(StockInitial()) {

    
    on<LoadStocks>((event, emit) {
      final stocks = repository.getStocks();
      emit(StockLoaded(stocks));
    });


    on<SaveWatchlist>((event, emit) {
      if (state is StockLoaded) {
        final currentState = state as StockLoaded;
        emit(currentState.copyWith(stocks: event.updatedList));
      }
    });

   
    on<ReorderStocks>((event, emit) {
      if (state is StockLoaded) {
        final currentState = state as StockLoaded;

       
        final List<Stock> updatedList =
            List<Stock>.from(currentState.stocks);

        int newIndex = event.newIndex;

       
        if (newIndex > event.oldIndex) {
          newIndex--;
        }

        final item = updatedList.removeAt(event.oldIndex);
        updatedList.insert(newIndex, item);

    
        emit(currentState.copyWith(stocks: updatedList));
      }
    });
  }
}