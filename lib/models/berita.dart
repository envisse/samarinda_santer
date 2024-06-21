class Berita {
  final String id;
  final String judul;
  final String sumber;

  Berita({
    required this.id,
    required this.judul,
    required this.sumber,
  });
  factory Berita.listFromMap(Map<String, dynamic> map) {
    return Berita(
      id: map['uuid'],
      judul: map['judul'],
      sumber: map['sumber'],
    );
  }
}
