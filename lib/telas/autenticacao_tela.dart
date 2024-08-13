import 'package:flutter/material.dart';
import 'package:gym_app/_comum/Meu_snackbar.dart';
import 'package:gym_app/_comum/minhas_cores.dart';
import 'package:gym_app/componentes/decoracao_campo_autenticacao.dart';
import 'package:gym_app/servicos/autenticacao_servico.dart';

class AutenticacaoTela extends StatefulWidget {
  const AutenticacaoTela({super.key});

  @override
  State<AutenticacaoTela> createState() => _AutenticacaoTelaState();
}

class _AutenticacaoTelaState extends State<AutenticacaoTela> {
  bool queroEntrar = true;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _nomeController = TextEditingController();

  final AutenticacaoServico _autenticacaoServico = AutenticacaoServico();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  MinhasCores.azulTopoGradiente,
                  MinhasCores.azulBaixoGradiente
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Image.asset("assets/logo.png", height: 128),
                      const Text(
                        "GymApp",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      TextFormField(
                        controller: _emailController,
                        decoration: getAuthenticationInputDecoration("E-mail"),
                        validator: (String? value) {
                          if (value == null) {
                            return "O e-mail não pode ser vazio";
                          } else if (value.length < 5) {
                            return "O e-mail é muito curto";
                          } else if (!value.contains("@")) {
                            return "O e-mail não é válido";
                          }

                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        controller: _senhaController,
                        decoration: getAuthenticationInputDecoration("Senha"),
                        obscureText: true,
                        validator: (String? value) {
                          if (value == null) {
                            return "A senha não pode ser vazia";
                          } else if (value.length < 5) {
                            return "A senha é muito curto";
                          }

                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Visibility(
                        visible: !queroEntrar,
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: getAuthenticationInputDecoration(
                                  "Confirmar senha"),
                              obscureText: true,
                              validator: (String? value) {
                                if (value == null) {
                                  return "A senha não pode ser vazia";
                                } else if (value.length < 5) {
                                  return "A senha é muito curto";
                                }

                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            TextFormField(
                              controller: _nomeController,
                              decoration:
                                  getAuthenticationInputDecoration("Nome"),
                              validator: (String? value) {
                                if (value == null) {
                                  return "O nome não pode ser vazio";
                                } else if (value.length < 5) {
                                  return "O nome é muito curto";
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.zero),
                          ),
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {
                          botaoPrincipalClicado();
                        },
                        child: Text((queroEntrar) ? "Entrar" : "Cadastrar"),
                      ),
                      const Divider(),
                      TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.blue,
                        ),
                        onPressed: () {
                          setState(() {
                            queroEntrar = !queroEntrar;
                          });
                        },
                        child: Text((queroEntrar)
                            ? "Ainda não tem uma conta? Cadastre-se"
                            : "Já tem uma conta? Entre"),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  botaoPrincipalClicado() {
    String nome = _nomeController.text;
    String email = _emailController.text;
    String senha = _senhaController.text;

    if (_formKey.currentState!.validate()) {
      if (queroEntrar) {
        print("Entrada Validada");
        _autenticacaoServico
            .logarUsuarios(email: email, senha: senha)
            .then((String? erro) {
          if (erro != null) {
            mostrarSnackbar(context: context, texto: erro);
          }
        });
      } else {
        print("Cadastro Validado");
        print(
            "${_emailController.text},${_senhaController.text},${_nomeController.text}");
        _autenticacaoServico
            .cadastrarUsuario(
          nome: nome,
          senha: senha,
          email: email,
        )
            .then((String? erro) {
          if (erro != null) {
            mostrarSnackbar(context: context, texto: erro);
          }
        });
      }
    } else {
      print("Form Inválido");
    }
  }
}
