class ItemModel{
  late int page;
  late int per_page;
  late int total;
  late int total_pages;
  List<Album> data = [];

  ItemModel.fromJson(Map<String, dynamic> parsedJson) {
    page = parsedJson['page'];
    per_page = parsedJson['per_page'];
    total_pages = parsedJson['total_pages'];
    List<Album> temp = [];
    for (int i = 0; i < parsedJson['data'].length; i++) {
      Album result = Album(parsedJson['data'][i]);
      temp.add(result);
    }
    data = temp;
  }
}



class Album{
  late int id;
  late String email;
  late String firstname;
  late String lastname;
  late String avatar;
  // factory Album.fromJson(Map<String, dynamic> json) {
  //   return Album(
  //     email: json['email'],
  //     id: json['id'],
  //     firstname: json['first_name'],
  //     lastname: json['last_name'],
  //     avatar: json['avatar'],
  //   );
  // }
  Album(result){
    id = result['id'];
    email = result['email'];
    firstname = result['first_name'];
    lastname = result['last_name'];
    avatar = result['avatar'];
  }
}