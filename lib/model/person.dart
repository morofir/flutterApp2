class Person{
  String fullname;
  String? phoneNumber;
  String? imageUrl;

  Person.fromJSON(Map<String,dynamic> json): 
  fullname = "${json["name"]["first"]} ${json["name"]["last"]}",
  phoneNumber = json["phone"],
  imageUrl = json["picture"]["thumbnail"];
  }
