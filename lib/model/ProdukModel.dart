class ProdukModel {
  int? count;
  Null? next;
  Null? previous;
  List<Results>? results;

  ProdukModel({this.count, this.next, this.previous, this.results});

  ProdukModel.fromJson(Map<String, dynamic> json) {
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
  int? stok;
  String? keterangan;
  String? idMesin;
  String? gambar;
  int? harga;
  String? kategori;
  int? penukar;
  String? created;
  String? updated;

  Results(
      {this.sId,
      this.nama,
      this.stok,
      this.keterangan,
      this.idMesin,
      this.gambar,
      this.harga,
      this.kategori,
      this.penukar,
      this.created,
      this.updated});

  Results.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    nama = json['nama'];
    stok = json['stok'];
    keterangan = json['keterangan'];
    idMesin = json['id_mesin'];
    gambar = json['gambar'];
    harga = json['harga'];
    kategori = json['kategori'];
    penukar = json['penukar'];
    created = json['created'];
    updated = json['updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['nama'] = this.nama;
    data['stok'] = this.stok;
    data['keterangan'] = this.keterangan;
    data['id_mesin'] = this.idMesin;
    data['gambar'] = this.gambar;
    data['harga'] = this.harga;
    data['kategori'] = this.kategori;
    data['penukar'] = this.penukar;
    data['created'] = this.created;
    data['updated'] = this.updated;
    return data;
  }
}
