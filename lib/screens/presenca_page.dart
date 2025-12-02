import 'package:flutter/material.dart';

class PresencaPage extends StatefulWidget {
  const PresencaPage({super.key});

  @override
  State<PresencaPage> createState() => _PresencaPageState();
}

class _PresencaPageState extends State<PresencaPage> {
  final List<String> _turmas = ['Kids', 'Adulto', 'Iniciante', 'Avançado'];
  String _turmaSelecionada = 'Kids';

  // MOCK de alunos
  final List<Map<String, dynamic>> _alunos = [
    {'nome': 'Carlos Silva', 'presente': true},
    {'nome': 'Ana Souza', 'presente': false},
    {'nome': 'João Pedro', 'presente': true},
    {'nome': 'Marcos Lima', 'presente': false},
  ];

  @override
  Widget build(BuildContext context) {
    final hoje = _formatarDataHoje();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Controle de Presença'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                const Text('Turma: '),
                const SizedBox(width: 8),
                DropdownButton<String>(
                  value: _turmaSelecionada,
                  items: _turmas
                      .map((t) => DropdownMenuItem(
                            value: t,
                            child: Text(t),
                          ))
                      .toList(),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() => _turmaSelecionada = value);
                    }
                  },
                ),
                const Spacer(),
                Text(
                  hoje,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton.icon(
                  onPressed: () {
                    // TODO: abrir leitor de QR Code
                  },
                  icon: const Icon(Icons.qr_code_scanner),
                  label: const Text('QR Code'),
                ),
                OutlinedButton.icon(
                  onPressed: () {
                    setState(() {
                      for (var a in _alunos) {
                        a['presente'] = true;
                      }
                    });
                  },
                  icon: const Icon(Icons.list),
                  label: const Text('Marcar todos'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.separated(
                itemCount: _alunos.length,
                separatorBuilder: (_, __) => const Divider(height: 1),
                itemBuilder: (context, index) {
                  final aluno = _alunos[index];
                  final presente = aluno['presente'] as bool;

                  return ListTile(
                    leading: const CircleAvatar(
                      child: Icon(Icons.person),
                    ),
                    title: Text(aluno['nome'] as String),
                    trailing: Switch(
                      value: presente,
                      onChanged: (value) {
                        setState(() {
                          aluno['presente'] = value;
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  // TODO: salvar no backend
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Presenças salvas (mock).'),
                    ),
                  );
                },
                icon: const Icon(Icons.save),
                label: const Text('Salvar presença'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatarDataHoje() {
    final now = DateTime.now();
    return '${now.day.toString().padLeft(2, '0')}/'
        '${now.month.toString().padLeft(2, '0')}/'
        '${now.year}';
  }
}