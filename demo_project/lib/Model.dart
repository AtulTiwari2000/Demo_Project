class DartModel {
  final int? id;
  final String? title;
  final String? body;

  DartModel({this.id, this.title, this.body});

  factory DartModel.fromJson(Map<String, dynamic> json) {
    return DartModel(
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'body': body,
  };
}
