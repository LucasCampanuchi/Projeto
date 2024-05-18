import 'dart:convert';

import 'package:projeto_teste/common/base.model.dart';

import '../api/constants.dart';

class NewsModel extends BaseModel {
  NewsModel({
    required this.id,
    required this.tipo,
    required this.titulo,
    required this.introducao,
    required this.dataPublicacao,
    required this.produtoId,
    required this.produtos,
    required this.editorias,
    required this.imagens,
    required this.produtosRelacionados,
    required this.destaque,
    required this.link,
  });
  late final int id;
  late final String tipo;
  late final String titulo;
  late final String introducao;
  late final String dataPublicacao;
  late final int produtoId;
  late final String produtos;
  late final String editorias;
  late final List<String> imagens;
  late final String produtosRelacionados;
  late final bool destaque;
  late final String link;

  @override
  NewsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tipo = json['tipo'];
    titulo = json['titulo'];
    introducao = json['introducao'];
    dataPublicacao = json['data_publicacao'];
    produtoId = json['produto_id'];
    produtos = json['produtos'];
    editorias = json['editorias'];
    try {
      imagens = (jsonDecode(json['imagens']) as Map<String, dynamic>)
          .values
          .map(
            (e) => e.toString(),
          )
          .toList()
          .where((element) => element != '')
          .map(
            (e) => '$URL_BASE_IMAGES/$e',
          )
          .toList();
    } catch (e) {
      imagens = [];
    }

    produtosRelacionados = json['produtos_relacionados'];
    destaque = json['destaque'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['tipo'] = tipo;
    data['titulo'] = titulo;
    data['introducao'] = introducao;
    data['data_publicacao'] = dataPublicacao;
    data['produto_id'] = produtoId;
    data['produtos'] = produtos;
    data['editorias'] = editorias;
    data['imagens'] = imagens;
    data['produtos_relacionados'] = produtosRelacionados;
    data['destaque'] = destaque;
    data['link'] = link;
    return data;
  }
}
