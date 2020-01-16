// {"data": {"microtimestamp": "1578898551674128", "amount": 0.26164564, "buy_order_id": 4559545100, "sell_order_id": 4559544845, "amount_str": "0.26164564", "price_str": "8050.01", "timestamp": "1578898551", "price": 8050.01, "type": 0, "id": 103013183}, "event": "trade", "channel": "live_trades_btcusd"}

class Trade {
  int tradeId;
  double amount;
  double price;
  String type;
  String timestamp;
  double totalTraded;

  Trade({
    this.amount,
    this.price,
    this.timestamp = '2020-01-13 09:55:51.000',
    this.totalTraded = 0.0,
    this.tradeId = 0,
    this.type = 'sell',
  });

  set tradeAmount(double val) {
    amount = val;
  }

  set tradePrice(double val) {
    price = val;
  }

  set tradeType(int val) {
    type = val == 0 ? 'buy' : 'sell';
  }

  set tradeTime(String val) {
    var date = DateTime.fromMillisecondsSinceEpoch(
        int.tryParse(val) ?? 1578898551 * 1000);
    timestamp = date.toString();
  }

  set totalAmountTraded(double previousTotal) {
    totalTraded = amount + previousTotal;
  }

  Map<String, dynamic> get map => {
        'id': tradeId,
        'amount': amount,
        'price': price,
        'type': type,
        'time': timestamp,
        'total': totalTraded
      };
}
