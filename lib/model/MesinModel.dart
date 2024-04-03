class MesinModel {
  int? count;
  Null? next;
  Null? previous;
  List<Results>? results;

  MesinModel({this.count, this.next, this.previous, this.results});

  MesinModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['next'] = this.next;
    data['previous'] = this.previous;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  String? sId;
  String? nama;
  int? kapasitas;
  int? terisi;
  String? lokasi;
  String? origin;
  String? idPenggunaAktif;
  String? created;
  String? updated;

  Results(
      {this.sId,
      this.nama,
      this.kapasitas,
      this.terisi,
      this.lokasi,
      this.origin,
      this.idPenggunaAktif,
      this.created,
      this.updated});

  Results.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    nama = json['nama'];
    kapasitas = json['kapasitas'];
    terisi = json['terisi'];
    lokasi = json['lokasi'];
    origin = json['origin'];
    idPenggunaAktif = json['id_pengguna_aktif'];
    created = json['created'];
    updated = json['updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['nama'] = this.nama;
    data['kapasitas'] = this.kapasitas;
    data['terisi'] = this.terisi;
    data['lokasi'] = this.lokasi;
    data['origin'] = this.origin;
    data['id_pengguna_aktif'] = this.idPenggunaAktif;
    data['created'] = this.created;
    data['updated'] = this.updated;
    return data;
  }
}
