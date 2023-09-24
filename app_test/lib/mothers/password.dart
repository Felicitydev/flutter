class Password{
  int? id;
  late String name;
  late String password;

  Password(this.name, this.password);

  //transform the pwd objet into the map (key:value) cause the sembast takes the map objet to insert in update date

  Map<String, dynamic> toMap(){
    return {
      'id': id,
      'name': name,
      'password': password,
    };
  }

   //before interaction in ui, transform the map object in instance of pwd

  Password.fromMap(Map<String, dynamic> map){
    id = map['id'];
    name = map['name'];
    password = map['password'];
  }
}