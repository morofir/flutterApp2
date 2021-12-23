import 'dart:convert';

import 'package:first_app/model/person.dart';
import 'package:http/http.dart' as http;

const String randomPersonUrl = 'https://randomuser.me/api/';
class PersonNetworkService{
  
  // "results": [
  //   {
  //     "gender": "male",
  //     "name": {
  //       "title": "mr",
  //       "first": "brad",
  //       "last": "gibson"
  //     },
  //   }
  //we return future, as a list of persons
  //https://randomuser.me/api/?results=10 example url
  Future<List<Person>> fetchPersons(int amount) async{ //is a future and we need the response
    http.Response response = await http.get(Uri.https("$randomPersonUrl","?results=$amount")); 

    if(response.statusCode == 200){
      Map peopleData = jsonDecode(response.body);
      List<dynamic> people = peopleData["results"];
      return people.map((json)=>Person.fromJSON(json)).toList();

    }else{
      throw Exception("Something went wront, ${response.statusCode}");
    }
  }

}