// Importando as bibliotecas necessárias
import 'dart:convert'; // Biblioteca para lidar com codificação e decodificação de JSON.
import '../model/filme.dart'; // Importando a classe Filme do seu modelo.

// Definindo a classe FilmeApi
class FilmeApi {
  // Uma string que simula a resposta da API em formato JSON.
  String respostaApi =
      '''
    [
      {
          "id": 1,
          "titulo": "Homem de Ferro 2",
          "resumo":"Filme do Homem de Ferro",
          "atores":"Robert Downey",
          "capa":"https://roveran.files.wordpress.com/2017/11/iron-man-2-capa-min.jpg",
          "duracao":140
      }
    ]
    ''';
  // Definindo um método assíncrono para buscar filmes offline.
  Future<List<Filme>> getFilmesOffline() async {
    // Decodificando a string JSON para um objeto Dart.
    final json = jsonDecode(respostaApi);

    // Convertendo os objetos JSON em List<Map<String, dynamic>>.
    final mapsFilme = json.cast<Map<String, dynamic>>();

    // Criando uma lista vazia para armazenar os objetos Filme.
    List<Filme> listFilmes = [];

    // Iterando por cada mapa de filme e convertendo em objetos Filme.
    for (var map in mapsFilme) {
      Filme filme = Filme.fromJson(map);
      listFilmes.add(filme);
    }

    // Delay simulado de 1 segundo (para simular o tempo de resposta da API).
    await Future.delayed(const Duration(seconds: 1));

    // Retornando a lista de filmes após o processo.
    return listFilmes;
  }
}
