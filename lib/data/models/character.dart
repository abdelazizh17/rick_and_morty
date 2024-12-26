class Character {
  late int charId;
  late String name;
  late String image;
  late String statusIfDeadOrAlive;
  late String species;
  late String gender;
  late String location;

  Character.fromJson(Map<String, dynamic> json) {
    charId = json['id'];
    name = json['name'];
    image = json['image'];
    statusIfDeadOrAlive = json['status'];
    species = json['species'];
    gender = json['gender'];
    location = json['location']['name'];
  }
}
