import 'package:myapp/models/place_model.dart';
import "package:http/http.dart" as http;
import 'dart:convert';
class PlaceService{

  static final _service = new PlaceService();

  static PlaceService get(){

    return _service;


  }

    final String url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=-8.189868,%20-34.954734&radius=5000&type=restaurant&key=AIzaSyBv6UieBEcwH2nK91GpQ-BpzPnQBybco6E";


  Future<List<Place>> getNearbyPlaces() async{

    var response  =  await http.get(url,headers:{"Accept":"application/json"});
    var places = <Place>[];

    List data = json.decode(response.body)["results"];

    data.forEach((f) => places.add(new Place(f["icon"],f["name"],f["rating"].toString(),f["vicinity"],f["place_id"])));
    return places;

  }

  final String urldetalhes =  "https://maps.googleapis.com/maps/api/place/details/json?key=AIzaSyBv6UieBEcwH2nK91GpQ-BpzPnQBybco6E&placeid=" ;

  Future getPlace(Place place) async {
    var response = await http.get(urldetalhes + place.id, headers:{"Accept":"application/json"});
    var result = json.decode(response.body)["result"];

    List<String> weekdays=[];

    if (result["openning_hours"] != null){

      weekdays = result["openning_hours"]["week_text"];

    }

    place.weekday = weekdays;
    place.formatted_address = result["formatted_address"];
    place.international_phone_number = result["international_phone_number"];
    return place;


  }




}