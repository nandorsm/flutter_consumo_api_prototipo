class Usuario {
  int? id;
  String? audioFile;

  Usuario({id, audioFile});

  Usuario.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    audioFile = json['audio_file'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['audio_file'] = audioFile;
    return data;
  }
}
