import 'package:flutter/material.dart';
import 'package:projetomoderno/models/cliente_model.dart';

class ClientesViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Clientes'),
      ),
      body: ListView.builder(
        itemCount: clientes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(clientes[index].nome),
            subtitle: Text(clientes[index].cpf),
          );
        },
      ),
    );
  }
}

List<Cliente> clientes = [
  Cliente(
    nome: 'João',
    endereco: 'Rua A, 123',
    cpf: '123.456.789-00',
    telefone: '(11) 1234-5678',
  ),
  Cliente(
    nome: 'Maria',
    endereco: 'Rua B, 456',
    cpf: '987.654.321-00',
    telefone: '(11) 8765-4321',
  ),
  Cliente(
    nome: 'Pedro',
    endereco: 'Rua C, 789',
    cpf: '456.789.123-00',
    telefone: '(11) 4321-5678',
  ),
];
