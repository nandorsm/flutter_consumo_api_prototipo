import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

//import 'Usuario.dart';
import 'Resultados.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _HomePageState();
}

class _HomePageState extends State<ResultPage> {

  late Future<List<Resultados>> results;

  @override
  void initState(){
    super.initState();
    results = pegarUsuario();
  }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Usuários'),
      ),
      body: Center(
        child: FutureBuilder<List<Resultados>>(
          future: results,
          builder: ((context, snapshot) {
            if(snapshot.hasData){
              
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index){
                  Resultados resultado = snapshot.data![index];
                  return Card(
                    child: Column(
                      children: [
                        Text('Status: ${resultado.status.toString()}'),
                        Text('UserID: ${resultado.userId.toString()}'),
                        Text('Probabilidade: ${resultado.probabilidade.toString()}'),

                      ],
                    ),
                  );
                });
            }else if(snapshot.hasError){
              return Text(snapshot.error.toString());
            }
            return const CircularProgressIndicator();
          }),
        ),
      ),
    );
  }

  Future<List<Resultados>> pegarUsuario() async {

    var url = Uri.parse('http://127.0.0.1:8000/api/v1/resultados/');
    var response = await http.get(url);
    if(response.statusCode == 200) {
      final Map<String, dynamic> decodedJson = jsonDecode(response.body);
      final List<dynamic> listaUsuario = decodedJson['results'];
      return listaUsuario.map((json) => Resultados.fromJson(json)).toList();
    }else{
      throw Exception('Erro não foi possível carregar os usuários.');
    }
  }

}