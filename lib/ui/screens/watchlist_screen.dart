


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock/model/stock_model.dart';
import '../../bloc/stock_bloc.dart';
import '../../bloc/stock_event.dart';
import '../../bloc/stock_state.dart';

class EditWatchlistScreen extends StatefulWidget {
  @override
  State<EditWatchlistScreen> createState() => _EditWatchlistScreenState();
}

class _EditWatchlistScreenState extends State<EditWatchlistScreen> {
  List<Stock> localList = [];

  @override
  void initState() {
    super.initState();

    final state = context.read<StockBloc>().state;
    if (state is StockLoaded) {
      localList = List.from(state.stocks);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (localList.isEmpty) {
      return Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Watchlist"),
      ),

      body: Column(
        children: [
          /// 🔹 List
          Expanded(
            child: ReorderableListView.builder(
              itemCount: localList.length,
buildDefaultDragHandles: false,
              onReorder: (oldIndex, newIndex) {
                setState(() {
                  if (newIndex > oldIndex) newIndex--;

                  final item = localList.removeAt(oldIndex);
                  localList.insert(newIndex, item);
                });
              },

              itemBuilder: (context, index) {
                final stock = localList[index];

                return Container(
               
                  key: ValueKey('${stock.symbol}_$index'),

                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.grey.shade300),
                    ),
                  ),

                  child: Row(
                    children: [
                      ReorderableDragStartListener(
                        index: index,
                        child: Icon(Icons.drag_handle, color: Colors.grey),
                      ),

                      SizedBox(width: 10),

                      Expanded(
                        child: Text(
                          stock.name,
                          style: TextStyle(fontSize: 16),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),

                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          setState(() {
                            localList.removeAt(index);
                          });
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          /// 🔹 Save Button
          Padding(
            padding: EdgeInsets.all(12),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                minimumSize: Size(double.infinity, 50),
              ),
              onPressed: () {
                context.read<StockBloc>().add(SaveWatchlist(localList));

                Navigator.pop(context);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Watchlist Updated")),
                );
              },
              child: Text("Save Watchlist"),
            ),
          ),
        ],
      ),
   
   
    );
  }
}