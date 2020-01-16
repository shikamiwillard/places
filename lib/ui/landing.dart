import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_container/data/local/bloc_provider.dart';
import 'package:flutter_container/data/local/tradeBloc.dart';
import 'package:flutter_container/models/trade.dart';
import 'package:flutter_container/routes/routes.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPage createState() => _LandingPage();
}

class _LandingPage extends State<LandingPage> {
  var tradeBloc;
  @override
  void dispose() {
    tradeBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    tradeBloc = BlocProvider.of<TradeBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('MasterClass Demo', style: TextStyle(color: Colors.white)),
        brightness: Brightness.dark,
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 60,
            ),
            child: StreamBuilder(
              stream: tradeBloc.tradesStream.stream,
              builder: (BuildContext context, AsyncSnapshot<Trade> snapshot) {
                if (snapshot.hasError) return Text('Error: ${snapshot.error}');
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return Text('Select lot');
                  case ConnectionState.waiting:
                    return Text('Awaiting trades...');
                  case ConnectionState.active:
                    return Center(
                      child: Column(
                        children: <Widget>[
                          TradeCard(
                            trade: snapshot.data,
                          ),
                          SizedBox(height: 30),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text('Total BTC traded:'),
                              SizedBox(height: 10),
                              Text(
                                '${snapshot.data.map["total"]}',
                                style: TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueAccent,
                                ),
                              ),
                              SizedBox(height: 20),
                              Container(
                                width: double.infinity,
                                height: 48,
                                child: RawMaterialButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, Routes.trades);
                                  },
                                  child: Text('View all Trades >'),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  case ConnectionState.done:
                    return Text('\$${snapshot.data} (closed)');
                }
                return null; // unreachable
              },
            ),
          ),
        ],
      ),
    );
  }
}

class TradeCard extends StatelessWidget {
  TradeCard({this.trade});
  Trade trade;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 460,
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.5),
            ),
            child: Center(
              child: Text(
                'USD/BTC live trades',
                style: TextStyle(fontWeight: FontWeight.w800),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 400,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.withOpacity(0.6))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 20),
                TradeData(type: 'Trade ID', value: trade.map['id']),
                TradeData(type: 'Trade Time', value: trade.map['time']),
                TradeData(type: 'Trade Type', value: trade.map['type']),
                TradeData(
                    type: 'Trade Amount in BTC', value: trade.map['amount']),
                TradeData(type: '1 BTC to USD', value: trade.map['price']),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TradeData extends StatelessWidget {
  TradeData({this.type, this.value});
  String type;
  var value;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(type),
        SizedBox(height: 10),
        Text(
          '${value}',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.grey.withOpacity(0.4)))),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
