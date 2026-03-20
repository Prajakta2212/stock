


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock/ui/screens/watchlist_screen.dart';
import '../../bloc/stock_bloc.dart';
import '../../bloc/stock_state.dart';
import '../widgets/stock_tile.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNav(),
      body: SafeArea(
        child: Column(
          children: [
            _topMarketBar(),
            _searchBar(),
            _tabs(),

            
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => BlocProvider.value(
                      value: context.read<StockBloc>(),
                      child: EditWatchlistScreen(),
                    ),
                  ),
                );
              },
              borderRadius: BorderRadius.circular(8),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 12),
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.swap_vert, size: 18, color: Colors.black54),
                    SizedBox(width: 6),
                    Text(
                      "Sort by",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 4),
                    Icon(Icons.arrow_drop_down, size: 18),
                  ],
                ),
              ),
            ),

            /// 🔹 Stock List
            Expanded(
              child: BlocBuilder<StockBloc, StockState>(
                builder: (context, state) {
                  if (state is StockLoaded) {
                    return ListView.builder(
                      itemCount: state.stocks.length,
                      itemBuilder: (context, index) {
                        return StockTile(stock: state.stocks[index]);
                      },
                    );
                  }
                  return Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _topMarketBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      color: Colors.grey.shade100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("SENSEX", style: TextStyle(fontSize: 12, color: Colors.grey)),
              SizedBox(height: 2),
              Row(
                children: [
                  Text("1,225.55",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(width: 4),
                  Text("+144.50", style: TextStyle(color: Colors.green)),
                ],
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("NIFTY BANK",
                  style: TextStyle(fontSize: 12, color: Colors.grey)),
              SizedBox(height: 2),
              Row(
                children: [
                  Text("54,172.15",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(width: 4),
                  Text("-14.75", style: TextStyle(color: Colors.red)),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _searchBar() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search for instruments",
          prefixIcon: Icon(Icons.search),
          filled: true,
          fillColor: Colors.grey.shade200,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _tabs() {
    return Row(
      children: [
        _tab("Watchlist 1", true),
        _tab("Watchlist 5", false),
        _tab("Watchlist 6", false),
      ],
    );
  }

  Widget _tab(String title, bool selected) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: selected ? Colors.black : Colors.grey,
        ),
      ),
    );
  }
 Widget _bottomNav() {
    return BottomNavigationBar(
      currentIndex: 0,
  selectedItemColor: Colors.black,
  unselectedItemColor: Colors.black54,

  selectedLabelStyle: TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
  ),

  unselectedLabelStyle: TextStyle(
    color: Colors.black54,
  ),  
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: "Watchlist"),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Orders"),
        BottomNavigationBarItem(icon: Icon(Icons.flash_on), label: "GTT"),
        BottomNavigationBarItem(icon: Icon(Icons.work), label: "Portfolio"),
         BottomNavigationBarItem(icon: Icon(Icons.wallet), label: "Portfolio"),
        BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: "Profile"),
      ],
    );
  }
}