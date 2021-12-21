class User {
  final String id;
  final String name;
  final String imagen;

  User({this.id, this.name, this.imagen});

  factory User.fromJson(json) {
    return User(
      name: json['name'],
      imagen: json['image'],
    );
  }
}
