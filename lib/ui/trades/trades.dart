import 'package:flutter/material.dart';
import 'package:flutter_container/data/local/bloc_provider.dart';
import 'package:flutter_container/data/local/tradeBloc.dart';
import 'package:flutter_container/models/trade.dart';

class Trades extends StatefulWidget {
  @override
  _Trades createState() => _Trades();
}

class _Trades extends State<Trades> {
  var tradeBloc;
  // @override
  // void dispose() {
  //   tradeBloc.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    tradeBloc = BlocProvider.of<TradeBloc>(context);
    return StreamBuilder(
      stream: tradeBloc.tradesStream.stream,
      builder: (BuildContext context, AsyncSnapshot<Trade> snapshot) {
        if (snapshot.hasError) return Text('Error: ${snapshot.error}');
        if (tradeBloc.allTrades.length > 0) {
          return ListView.builder(
            reverse: true,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            itemCount: tradeBloc.allTrades.length,
            itemBuilder: (context, index) {
              return Container(
                width: double.infinity,
                height: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('${tradeBloc.allTrades[index].map["type"]}'),
                    SizedBox(height: 5),
                    Text(
                        '${tradeBloc.allTrades[index].map["amount"]} BTC @ \$${tradeBloc.allTrades[index].map["price"]}')
                  ],
                ),
              );
            },
          );
        }
        return null; // unreachable
      },
    );
  }
}
