import 'package:flutter/material.dart';
import 'presenca_page.dart';
import 'mensalidades_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    _HomeDashboard(),
    PresencaPage(),
    MensalidadesPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Painel - Kamikaze Team'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // TODO: tela de notificações
            },
          ),
        ],
      ),
      drawer: const _AppDrawer(),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() => _currentIndex = index);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Início'),
          BottomNavigationBarItem(
              icon: Icon(Icons.fact_check), label: 'Presenças'),
          BottomNavigationBarItem(
              icon: Icon(Icons.payments), label: 'Mensalidades'),
        ],
      ),
    );
  }
}

class _HomeDashboard extends StatelessWidget {
  const _HomeDashboard();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 28,
                child: Icon(Icons.person),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Professor Demo',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text('Academia: Kamikaze Team Matriz'),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              _HomeCard(
                title: 'Presenças',
                icon: Icons.fact_check,
                onTap: () => Navigator.pushNamed(context, '/presencas'),
              ),
              _HomeCard(
                title: 'Mensalidades',
                icon: Icons.payments,
                onTap: () => Navigator.pushNamed(context, '/mensalidades'),
              ),
              _HomeCard(
                title: 'Turmas & Academias',
                icon: Icons.groups,
                onTap: () {
                  // TODO: implementar tela de turmas e academias
                },
              ),
              _HomeCard(
                title: 'Eventos / Avisos',
                icon: Icons.event,
                onTap: () {
                  // TODO: implementar agenda/eventos
                },
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Text(
            'Resumo do dia',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Card(
            child: ListTile(
              title: const Text('Alunos presentes hoje'),
              subtitle: const Text('Kids: 12 | Adulto: 18 | Competição: 6'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {},
            ),
          ),
          Card(
            child: ListTile(
              title: const Text('Pagamentos recebidos hoje'),
              subtitle: const Text('Total: R\$ 1.250,00'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}

class _HomeCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const _HomeCard({
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 32),
              const SizedBox(height: 8),
              Text(
                title,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AppDrawer extends StatelessWidget {
  const _AppDrawer();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                'Kamikaze Team',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(Icons.fact_check),
            title: const Text('Presenças'),
            onTap: () => Navigator.pushNamed(context, '/presencas'),
          ),
          ListTile(
            leading: const Icon(Icons.payments),
            title: const Text('Mensalidades'),
            onTap: () => Navigator.pushNamed(context, '/mensalidades'),
          ),
          ListTile(
            leading: const Icon(Icons.groups),
            title: const Text('Turmas & Academias'),
            onTap: () {
              // TODO: implementar
            },
          ),
          ListTile(
            leading: const Icon(Icons.analytics),
            title: const Text('Financeiro'),
            onTap: () {
              // TODO: implementar
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Sair'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
    );
  }
}