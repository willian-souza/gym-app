class ExercicioModelo {
  String id;
  String nome;
  String treino;
  String comoFazer;
  String? urlImagem;

  //contrutor padrão(nomeado)
  ExercicioModelo({
    required this.id,
    required this.nome,
    required this.treino,
    required this.comoFazer,
  });

  //Método para converter um map para o objeto ExercicioModelo(vindo do banco de dados)
  ExercicioModelo.fromMap(Map<String, dynamic> map)
      : id = map["id"],
        nome = map["nome"],
        treino = map["treino"],
        comoFazer = map["comoFazer"],
        urlImagem = map["urlImagem"];

  //Método para converter um objeto ExercicioModelo em map (enviar para o banco de dados)
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "nome": nome,
      "treino": treino,
      "comoFazer": comoFazer,
      "urlImagem": urlImagem
    };
  }
}
