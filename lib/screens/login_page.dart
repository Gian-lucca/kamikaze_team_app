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
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            // ⭐ CONTEÚDO PRINCIPAL (scroll)
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'lib/img/logokamikaze.png',
                        width: double.infinity,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Gestão de Alunos e Equipes',
                        style: TextStyle(fontSize: 14),
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
                          onPressed: _isLoading ? null : () => _login(aluno: false),
                          child: _isLoading
                              ? const SizedBox(
                                  height: 16,
                                  width: 16,
                                  child: CircularProgressIndicator(strokeWidth: 2),
                                )
                              : const Text('Entrar (Professor / Dono)'),
                        ),
                      ),

                      TextButton(
                        onPressed: _isLoading ? null : () => _login(aluno: true),
                        child: const Text('Entrar como aluno'),
                      ),

                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            ),

            // ⭐ RODAPÉ FIXO
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
    );
  }
}