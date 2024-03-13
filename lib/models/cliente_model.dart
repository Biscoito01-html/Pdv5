class Cliente {
  String nome;
  String endereco;
  String cpf;
  String telefone;

  Cliente({
    required this.nome,
    required this.endereco,
    required this.cpf,
    required this.telefone,
  });
  factory Cliente.fromMap(Map<String, dynamic> map) {
    return Cliente(
      nome: map['nome'],
      endereco: map['endereco'],
      cpf: map['cpf'],
      telefone: map['telefone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'endereco': endereco,
      'cpf': cpf,
      'telefone': telefone,
    };
  }

  @override
  String toString() {
    return 'Cliente(nome: $nome, endereco: $endereco, cpf: $cpf, telefone: $telefone)';
  }
}
