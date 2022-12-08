class Resultados {
  int? id;
  String? status;
  String? probabilidade;
  int? userId;
  String? createdAt;
  int? audioFile;

  Resultados(
      {id,
      status,
      probabilidade,
      userId,
      createdAt,
      audioFile});

  Resultados.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['Status'];
    probabilidade = json['Probabilidade'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    audioFile = json['audio_file'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['Status'] = status;
    data['Probabilidade'] = probabilidade;
    data['user_id'] = userId;
    data['created_at'] = createdAt;
    data['audio_file'] = audioFile;
    return data;
  }
}