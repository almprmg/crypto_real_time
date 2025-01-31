import 'package:flutter/rendering.dart';
import 'package:web_socket_channel/io.dart';
import 'dart:convert';


class Websocket_binance {

dynamic channel ;
  IOWebSocketChannel  getResponse(String? Symbol  )  {
    
    final channel = IOWebSocketChannel.connect('wss://stream.binance.com:9443/ws/$Symbol@trade');
    return channel;
    }
  }