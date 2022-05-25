class UserModel {
  String? name;
  String? email;
  String? id;

  UserModel({this.name, this.email, this.id});

  String NameString(UserModel user1) {
    String nombre = user1.name.toString();
    return nombre;
  }
}
