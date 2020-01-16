import 'dart:async';
import 'dart:convert';
import 'package:flutter_container/data/local/bloc_provider.dart';
import 'package:web_socket_channel/io.dart';

import 'package:flutter_container/models/trade.dart';

class TradeBloc extends BlocBase {
  List<Trade> trades = [
    Trade(amount: 0.0, price: 0.0)
  ];

  final _rawTradesStreamCont =
      IOWebSocketChannel.connect('wss://ws.bitstamp.net');
  final StreamController<Trade> _tradesStreamCont = StreamController<Trade>.broadcast();

  TradeBloc() {
    _tradesStreamCont.sink.add(trades[0]);
    Map<dynamic, dynamic> data = {
      "event": "bts:subscribe",
      "data": {"channel": "live_trades_btcusd"}
    };
    _rawTradesStreamCont.sink.add(json.encode(data));
    _rawTradesStreamCont.stream.listen(_addTrade);
  }

  StreamController<Trade> get tradesStream => _tradesStreamCont;

  void _addTrade(_data) {
    Map data = json.decode(_data)['data'];
    if (data.containsKey('amount')) {
      Trade trade = Trade(
        amount: data['amount'],
        price: data['price'],
        tradeId: data['id']
      );
      trade.totalAmountTraded = trades.last.totalTraded;
      trade.tradeType = data['type'];
      trade.tradeTime = data['timestamp'];
      _tradesStreamCont.sink.add(trade);
      trades.add(trade);
      print(trade.amount);
    }
  }

  get allTrades => trades;

  void dispose() {
    _tradesStreamCont.close();
    _rawTradesStreamCont.sink.close();
  }
}
