import 'package:flutter/material.dart';

class MensalidadesPage extends StatelessWidget {
  const MensalidadesPage({super.key});

  @override
  Widget build(BuildContext context) {
    // MOCK de mensalidades
    final mensalidades = [
      {
        'nome': 'Carlos Silva',
        'status': 'pago',
        'valor': 200.0,
        'ultimoPagamento': '05/11/2025',
      },
      {
        'nome': 'Ana Souza',
        'status': 'pendente',
        'valor': 200.0,
        'ultimoPagamento': '05/10/2025',
      },
      {
        'nome': 'João Pedro',
        'status': 'atrasado',
        'valor': 250.0,
        'ultimoPagamento': '01/09/2025',
      },
    ];

    String _statusLabel(String status) {
      switch (status) {
        case 'pago':
          return 'Pago';
        case 'pendente':
          return 'Pendente';
        case 'atrasado':
          return 'Atrasado';
        default:
          return status;
      }
    }

    Color _statusColor(String status) {
      switch (status) {
        case 'pago':
          return Colors.green;
        case 'pendente':
          return Colors.amber;
        case 'atrasado':
          return Colors.red;
        default:
          return Colors.grey;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mensalidades'),
        actions: [
          IconButton(
            onPressed: () {
              // TODO: filtro avançado
            },
            icon: const Icon(Icons.filter_list),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Wrap(
                spacing: 8,
                children: const [
                  _StatusChip(label: 'Pago', color: Colors.green),
                  _StatusChip(label: 'Pendente', color: Colors.amber),
                  _StatusChip(label: 'Atrasado', color: Colors.red),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.separated(
                itemCount: mensalidades.length,
                separatorBuilder: (_, __) => const Divider(height: 1),
                itemBuilder: (context, index) {
                  final m = mensalidades[index];
                  final status = m['status'] as String;
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: _statusColor(status),
                      child: const Icon(Icons.person, color: Colors.white),
                    ),
                    title: Text(m['nome'] as String),
                    subtitle: Text(
                      'Último pagamento: ${m['ultimoPagamento']}\n'
                      'Valor: R\$ ${(m['valor'] as double).toStringAsFixed(2)}',
                    ),
                    isThreeLine: true,
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _statusLabel(status),
                          style: TextStyle(
                            color: _statusColor(status),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        if (status != 'pago')
                          TextButton(
                            onPressed: () {
                              // TODO: notificar aluno
                            },
                            child: const Text(
                              'Notificar',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  // TODO: notificar todos pendentes
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Notificações enviadas (mock).'),
                    ),
                  );
                },
                icon: const Icon(Icons.notifications_active),
                label: const Text('Notificar alunos pendentes'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatusChip extends StatelessWidget {
  final String label;
  final Color color;

  const _StatusChip({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label),
      backgroundColor: color.withOpacity(0.15),
      labelStyle: TextStyle(color: color),
      side: BorderSide(color: color),
    );
  }
}