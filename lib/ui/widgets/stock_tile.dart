
import 'package:flutter/material.dart';
import 'package:stock/model/stock_model.dart';

class StockTile extends StatelessWidget {
  final Stock stock;

  const StockTile({required this.stock});

  @override
  Widget build(BuildContext context) {
    final isPositive = stock.change >= 0;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(stock.name, style: TextStyle(fontWeight: FontWeight.w600)),
              SizedBox(height: 4),
              Text("NSE | EQ", style: TextStyle(color: Colors.grey)),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("₹${stock.price}",
                  style: TextStyle(
                      color: isPositive ? Colors.green : Colors.red,
                      fontWeight: FontWeight.bold)),
              SizedBox(height: 4),
              Text("${stock.change}%",
                  style: TextStyle(color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }
}