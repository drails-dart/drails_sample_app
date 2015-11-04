part of dson_sample_app_models;

@serializable
class User {
  int id;
  String name;
  String password;
  List<String> roles;
}