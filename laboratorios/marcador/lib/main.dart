import 'package:flutter/material.dart';

void main() {
  runApp(const MarcadorApp());
}

class MarcadorApp extends StatelessWidget {
  const MarcadorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Marcador(),
    );
  }
}

class Marcador extends StatefulWidget {
  const Marcador({super.key});

  @override
  State<Marcador> createState() => _MarcadorState();
}

class _MarcadorState extends State<Marcador> {
  int puntosA = 0;
  int puntosB = 0;

  String get resultado {
    if (puntosA > puntosB) {
      return 'Va ganando Equipo A';
    }

    if (puntosB > puntosA) {
      return 'Va ganando Equipo B';
    }

    return 'Empate';
  }

  void reiniciar() {
    setState(() {
      puntosA = 0;
      puntosB = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Marcador deportivo'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    color: puntosA > puntosB
                        ? Colors.green
                        : Colors.grey,
                    child: Column(
                      children: [
                        const Text(
                          'Equipo A',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '$puntosA',
                          style: const TextStyle(
                            fontSize: 50,
                            color: Colors.white,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              puntosA++;
                            });
                          },
                          child: const Text('+1'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              if (puntosA > 0) {
                                puntosA--;
                              }
                            });
                          },
                          child: const Text('-1'),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    color: puntosB > puntosA
                        ? Colors.green
                        : Colors.grey,
                    child: Column(
                      children: [
                        const Text(
                          'Equipo B',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '$puntosB',
                          style: const TextStyle(
                            fontSize: 50,
                            color: Colors.white,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              puntosB++;
                            });
                          },
                          child: const Text('+1'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              if (puntosB > 0) {
                                puntosB--;
                              }
                            });
                          },
                          child: const Text('-1'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Text(
              resultado,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: reiniciar,
              child: const Text('Reiniciar'),
            ),
          ],
        ),
      ),
    );
  }
}