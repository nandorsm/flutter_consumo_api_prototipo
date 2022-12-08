import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

//import 'Usuario.dart';
import 'usuario2.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late Future<List<Usuario>> usuarios;

  @override
  void initState(){
    super.initState();
    usuarios = pegarUsuario();
  }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Usuários'),
      ),
      body: Center(
        child: FutureBuilder<List<Usuario>>(
          future: usuarios,
          builder: ((context, snapshot) {
            if(snapshot.hasData){
              
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index){
                  Usuario usuario = snapshot.data![index];
                  return ListTile(
                    // title: Text(usuario.name!),
                    // subtitle: Text(usuario.website!), 
                    title: Text(usuario.audioFile!),
                    subtitle: Text(usuario.id.toString()),
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

  Future<List<Usuario>> pegarUsuario() async {
    //var url = Uri.parse('https://jsonplaceholder.typicode.com/users');
    //var url = Uri.parse('http://127.0.0.1:8000/api/v1/audios/');
    var url = Uri.parse('http://127.0.0.1:8000/api/v1/resultados/');
    var response = await http.get(url);
    if(response.statusCode == 200) {
      //List listaUsuario = json.decode(response.body);
      final Map<String, dynamic> decodedJson = jsonDecode(response.body);
      final List<dynamic> listaUsuario = decodedJson['results'];
      return listaUsuario.map((json) => Usuario.fromJson(json)).toList();
    }else{
      throw Exception('Erro não foi possível carregar os usuários.');
    }
  }

}