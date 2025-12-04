import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  bool _isLoading = false;

  void _login({bool aluno = false}) async {
    setState(() => _isLoading = true);

    // TODO: implementar autenticação real (API / Firebase)
    await Future<void>.delayed(const Duration(milliseconds: 700));

    if (!mounted) return;
    setState(() => _isLoading = false);
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; // 👈 pega altura/largura da tela

    return Scaffold(
      body: Stack(
        children: [
          // 🔻 TARJAS SUPERIORES
          Positioned(
            top: 10,
            left: -60,
            child: Transform.rotate(
              angle: -0.55,
              child: Container(
                width: 260,
                height: 22,
                color: const Color(0xFF7A0000),
              ),
            ),
          ),
          Positioned(
            top: 60,
            left: -30,
            child: Transform.rotate(
              angle: -0.55,
              child: Container(
                width: 300,
                height: 22,
                color: const Color(0xFF7A0000),
              ),
            ),
          ),

          // 🔻 TARJAS INFERIORES (AGORA PASSANDO ATRÁS DOS INPUTS)
          Positioned(
            top: size.height * 0.60, // começa mais ou menos na altura dos inputs
            right: -80,
            child: Transform.rotate(
              angle: -0.60,
              child: Container(
                width: size.width * 0.95,
                height: 22,
                color: const Color(0xFF7A0000),
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.70, // um pouco mais abaixo
            right: -40,
            child: Transform.rotate(
              angle: -0.61,
              child: Container(
                width: size.width * 0.85,
                height: 22,
                color: const Color(0xFF7A0000),
              ),
            ),
          ),

          // ⭐ CONTEÚDO DA TELA
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // LOGO 80%
                          FractionallySizedBox(
                            widthFactor: 0.8,
                            child: Image.asset(
                              'lib/img/logokamikaze.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                          const SizedBox(height: 24),

                          const Text(
                            'Seja Bem Vindo!',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          const SizedBox(height: 6),
                          const Text(
                            'Gestão de Alunos e Equipes',
                            style: TextStyle(fontSize: 15),
                          ),
                          const SizedBox(height: 32),

                          TextField(
                            controller: _emailController,
                            decoration: const InputDecoration(
                              labelText: 'Email',
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          const SizedBox(height: 16),
                          TextField(
                            controller: _senhaController,
                            obscureText: true,
                            decoration: const InputDecoration(
                              labelText: 'Senha',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 16),

                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed:
                                  _isLoading ? null : () => _login(aluno: true),
                              child: _isLoading
                                  ? const SizedBox(
                                      height: 16,
                                      width: 16,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                      ),
                                    )
                                  : const Text('Entrar como aluno'),
                            ),
                          ),
                          TextButton(
                            onPressed:
                                _isLoading ? null : () => _login(aluno: false),
                            child: const Text('Entrar (Professor / Dono)'),
                          ),

                          const SizedBox(height: 16),
                        ],
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    '© Copyright 2026 Gianlucca Augusto, Todos os direitos reservados.',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 11,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}