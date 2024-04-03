class RiwayatModel {
  int? count;
  Null? next;
  Null? previous;
  List<Results>? results;

  RiwayatModel({this.count, this.next, this.previous, this.results});

  RiwayatModel.fromJson(Map<String, dynamic> json) {
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
  String? idPengguna;
  String? idProduk;
  String? nama;
  String? gambar;
  String? kode;
  String? email;
  String? produk;
  int? jumlah;
  int? biaya;
  String? status;
  String? created;
  String? updated;

  Results(
      {this.sId,
      this.idPengguna,
      this.idProduk,
      this.nama,
      this.gambar,
      this.kode,
      this.email,
      this.produk,
      this.jumlah,
      this.biaya,
      this.status,
      this.created,
      this.updated});

  Results.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    idPengguna = json['id_pengguna'];
    idProduk = json['id_produk'];
    nama = json['nama'];
    gambar = json['gambar'];
    kode = json['kode'];
    email = json['email'];
    produk = json['produk'];
    jumlah = json['jumlah'];
    biaya = json['biaya'];
    status = json['status'];
    created = json['created'];
    updated = json['updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['id_pengguna'] = this.idPengguna;
    data['id_produk'] = this.idProduk;
    data['nama'] = this.nama;
    data['gambar'] = this.gambar;
    data['kode'] = this.kode;
    data['email'] = this.email;
    data['produk'] = this.produk;
    data['jumlah'] = this.jumlah;
    data['biaya'] = this.biaya;
    data['status'] = this.status;
    data['created'] = this.created;
    data['updated'] = this.updated;
    return data;
  }
}
