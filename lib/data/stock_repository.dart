

import 'package:stock/model/stock_model.dart';

class StockRepository {
  List<Stock> getStocks() {
    return [
      Stock(name: "Reliance", symbol: "NSE | EQ", price: 2450, change: 1.2),
      Stock(name: "TCS", symbol: "NSE | EQ", price: 3500, change: -0.5),
      Stock(name: "Infosys", symbol: "NSE | EQ", price: 1500, change: 0.8),
      Stock(name: "HDFC", symbol: "IDX", price: 2800, change: -1.1),
         Stock(name: "Reliance SEP 1880 CE", symbol: "NSE | MONTHLY", price: 0.00, change: 1.2),
      Stock(name: "Reliance SEP 1370 PE", symbol: "NSE | MONTHLY", price: 19.20, change: -0.5),
      Stock(name: "MRF", symbol: "NSE | EQ", price: 1625.00, change: 0.8),
      Stock(name: "MRF", symbol: "BSE | EQ", price: 1476, change: -1.1),
    ];
  }
}