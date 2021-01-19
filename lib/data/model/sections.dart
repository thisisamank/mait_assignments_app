class Section {
  final String id;
  final int year;
  final String secName;

  Section({this.year, this.id, this.secName});

  factory Section.fromJson(Map<String, dynamic> json, id) {
    return Section(id: id, secName: json['section'], year: json['year']);
  }
}
