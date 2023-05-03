import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});


  Stream<String> getLoadMessages(){
    final messages = <String>[
    'Cargando Peliculas',
    'Rellenando palomitas',
    'invitandola a "ver netflix"',
    'Ya casi...',
  ];
    return Stream.periodic(const Duration(milliseconds: 1200), (computationCount) {
      return messages[computationCount];
    }).take(messages.length);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('espere por favor', style: TextStyle(fontSize: 20),),
          const SizedBox(height: 10),
          const CircularProgressIndicator(
            strokeWidth: 2,
          ),
          const SizedBox(height: 10),
          StreamBuilder(
            stream: getLoadMessages(),
            builder: (context, snapshot) {
              if(!snapshot.hasData) return const Text('Cargando', style: TextStyle(fontSize: 15, color: Colors.cyanAccent),);
              return Text(snapshot.data!, style: const TextStyle(fontSize: 17, color: Colors.cyan));
            },
          )
        ],
      )
    );
  }
}