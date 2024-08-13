import 'package:flutter/material.dart';
import 'package:gym_app/_comum/minhas_cores.dart';
import 'package:gym_app/modelos/exercicio_modelo.dart';
import 'package:gym_app/modelos/sentimento_modelo.dart';

class ExercicioTela extends StatelessWidget {
  ExercicioTela({super.key});

  //declara um objeto ExercicioModelo
  final ExercicioModelo exercicioModelo = ExercicioModelo(
      id: "EX001",
      nome: "Pull Up",
      treino: "Treino A",
      comoFazer: "Pendurar na barra e puxar");

  //declara uma lista de sentimentos
  final List<SentimentoModelo> listaSentimentos = [
    SentimentoModelo(
      id: "SE001",
      sentindo: "Bastante cansado",
      data: "2024-08-05",
    ),
    SentimentoModelo(
      id: "SE002",
      sentindo: "Pouco cansado",
      data: "2024-08-05",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              exercicioModelo.nome,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            Text(
              exercicioModelo.treino,
              style: const TextStyle(fontSize: 15),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0,
        toolbarHeight: 72,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(32))),
        backgroundColor: MinhasCores.azulEscuro,
        foregroundColor: Colors.white,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
      body: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(16)),
        child: ListView(
          children: [
            SizedBox(
              height: 250,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.zero))),
                      onPressed: () {},
                      child: const Text("Enviar foto")),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.zero))),
                      onPressed: () {},
                      child: const Text("Tirar foto")),
                ],
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Como fazer?",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 8),
            Text(exercicioModelo.comoFazer),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Divider(color: Colors.black),
            ),
            const Text(
              "Como estou me sentindo?",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(listaSentimentos.length, (index) {
                SentimentoModelo sentimentoAgora = listaSentimentos[index];
                return ListTile(
                  dense: true,
                  contentPadding: const EdgeInsets.all(0),
                  title: Text(sentimentoAgora.sentindo),
                  subtitle: Text(sentimentoAgora.data),
                  leading: const Icon(Icons.double_arrow),
                  trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      )),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
