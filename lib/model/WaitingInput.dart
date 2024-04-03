class WaitingInput {
  // int? count;
  // Null? next;
  // Null? previous;
  List<Results>? results;

  WaitingInput({this.results});

  WaitingInput.fromJson(Map<String, dynamic> json) {
    // count = json['count'];
    // next = json['next'];
    // previous = json['previous'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // data['count'] = this.count;
    // data['next'] = this.next;
    // data['previous'] = this.previous;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  int? id;
  String? user;
  String? idUser;
  String? nama;
  String? email;
  String? phone;
  int? volume;
  int? poin;
  String? status;
  String? created;
  String? updated;

  Results(
      {this.id,
      this.user,
      this.idUser,
      this.nama,
      this.email,
      this.phone,
      this.volume,
      this.poin,
      this.status,
      this.created,
      this.updated});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'];
    idUser = json['id_user'];
    nama = json['nama'];
    email = json['email'];
    try {
      phone = json['phone'];
      volume = json['volume'];
      poin = json['poin'];
    } catch (e) {
      phone = "0";
      volume = 0;
      poin = 0;
    }
    status = json['status'];
    created = json['created'];
    updated = json['updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user'] = this.user;
    data['id_user'] = this.idUser;
    data['nama'] = this.nama;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['volume'] = this.volume;
    data['poin'] = this.poin;
    data['status'] = this.status;
    data['created'] = this.created;
    data['updated'] = this.updated;
    return data;
  }
}
