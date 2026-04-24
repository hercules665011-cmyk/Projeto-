import 'package:flutter/material.dart';

void main() {
  runApp(const GuarulhosRelatorioApp());
}

class GuarulhosRelatorioApp extends StatelessWidget {
  const GuarulhosRelatorioApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Relatório SEMOB Guarulhos 2025',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  final List<String> sections = const [
    'Resumo Geral',
    'Origem das Autuações',
    'Infrações por Tipo',
    'Contencioso Judicial',
    'Protocolos/Serviços Online',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Relatório 2025 - Guarulhos')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Conteúdos principais',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          ...sections.map(
            (s) => Card(
              child: ListTile(
                title: Text(s),
                trailing: const Icon(Icons.arrow_forward),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => SectionScreen(title: s)),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SectionScreen extends StatelessWidget {
  final String title;

  const SectionScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String content = _getContentFor(title);

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Text(
            content,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }

  String _getContentFor(String t) {
    if (t == 'Resumo Geral') {
      return 'A tabela mostra a predominância das autuações eletrônicas (675.833), ...\nOBS: multa jurídica representa 10,04% do total...';
    } else if (t == 'Origem das Autuações') {
      return '54.7% das autuações são de veículos licenciados em Guarulhos; 33.4% SP; 7.7% outros estados; 4.2% não identificados.';
    } else if (t == 'Infrações por Tipo') {
      return 'Tipos: Talonário papel 25.361; Eletrônico 675.833; NIC 83.232; Palm 83.183; Zona Azul 6.324.';
    } else if (t == 'Contencioso Judicial') {
      return 'Defesa Prévia: 2.270; Recurso JARI: 1.594; SEI: 447; Recurso CETRAN: 237. Total processos: 4.548.';
    } else {
      return 'Conteúdo adicional pode ser adicionado aqui, incluindo dados de protocolos.';
    }
  }
}
