class SentimentoModelo {
  String id;
  String sentindo;
  String data;

  //construtor padrao(nomeado)
  SentimentoModelo(
      {required this.id, required this.sentindo, required this.data});

  //Método para converter um map para o objeto ExercicioModelo(vindo do banco de dados)
  SentimentoModelo.fromMap(Map<String, dynamic> map)
      : id = map["id"],
        sentindo = map["sentindo"],
        data = map["data"];

  //Método para converter um objeto ExercicioModelo em map (enviar para o banco de dados)
  Map<String, dynamic> toMap() {
    return {
      "id": id,
       "sentindo": sentindo, 
       "data": data
    };
  }
}
