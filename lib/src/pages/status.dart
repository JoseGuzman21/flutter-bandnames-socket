import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:band_names/src/services/socket_service.dart';

class StatusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final socketService = Provider.of<SocketService>(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('Server status: ${socketService.serverStatus}')],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.message),
        onPressed: () {
          print('hola');
          // emitir un objeto que tenga el nombre
          socketService.emit('emitir-mensaje',
              {'nombre': 'flutter', 'mensaje': 'Hola desde '});
        },
      ),
    );
  }
}
