import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

// para manejar el estado del servidor
enum ServerStatus { Online, Offline, Connecting }

// ChangeNotifier le dice al provider cuando tiene que
// redibujar algún widget o cambiar el UI
class SocketService with ChangeNotifier {
  ServerStatus _serverStatus = ServerStatus.Connecting;
  IO.Socket _socket;

  // para poder retornar el _serverStatus
  ServerStatus get serverStatus => this._serverStatus;
  IO.Socket get socket => this._socket;
  Function get emit => this._socket.emit;

  SocketService() {
    _initConfig();
  }

  void _initConfig() {
    // Dart client
    this._socket =
        IO.io('https://flutter-socket-server-josegg.herokuapp.com/', {
      'transports': ['websocket'],
      'autoConnect': true
    });
    this._socket.onConnect((_) {
      this._serverStatus = ServerStatus.Online;
      notifyListeners();
    });
    this._socket.onDisconnect((_) {
      this._serverStatus = ServerStatus.Offline;
      notifyListeners();
    });
    // this._socket.on('nuevo-mensaje', (payload) {
    //   print('nuevo-mensaje:');
    //   print('nombre:' + payload['nombre']);
    //   print(payload.containsKey('mensaje2') ? payload['mensaje2'] : 'No hay');
    // });
  }
}
